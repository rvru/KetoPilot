import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class MoleculeBarsWidget extends StatefulWidget {
  final double glucoseMgDl;
  final double bhbMmol;
  final double gki;
  final double glucoseTarget;
  final double bhbTarget;
  final double gkiTarget;
  final double maxBarHeight;
  final bool showTargetLines;
  final bool showValues;

  const MoleculeBarsWidget({
    super.key,
    required this.glucoseMgDl,
    required this.bhbMmol,
    required this.gki,
    this.glucoseTarget = 100.0, // mg/dL
    this.bhbTarget = 1.5, // mmol/L
    this.gkiTarget = 1.0, // GKI ratio
    this.maxBarHeight = 160.0,
    this.showTargetLines = true,
    this.showValues = true,
  });

  @override
  State<MoleculeBarsWidget> createState() => _MoleculeBarsWidgetState();
}

class _MoleculeBarsWidgetState extends State<MoleculeBarsWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeader(),
            const SizedBox(height: 6),
            _buildMoleculeBars(),
            const SizedBox(height: 6),
            _buildLegend(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const Icon(Icons.biotech, color: AppTheme.primaryColor, size: 20),
        const SizedBox(width: 6),
        Text(
          'Daily Molecules',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.info_outline, size: 18),
          onPressed: () => _showMoleculeInfo(),
          padding: const EdgeInsets.all(4),
          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
        ),
      ],
    );
  }

  Widget _buildMoleculeBars() {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return SizedBox(
          height: widget.maxBarHeight * 0.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildGlucoseBar(widget.maxBarHeight * 0.8),
              _buildBhbBar(widget.maxBarHeight * 0.8),
              _buildGkiBar(widget.maxBarHeight * 0.8),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGlucoseBar(double availableHeight) {
    // Glucose scale: 0-200 mg/dL
    double maxValue = 200.0;
    double normalizedValue = widget.glucoseMgDl.clamp(0, maxValue);
    double normalizedTarget = widget.glucoseTarget.clamp(0, maxValue);

    return _buildMoleculeBar(
      label: 'Glucose',
      value: normalizedValue,
      targetValue: normalizedTarget,
      unit: 'mg/dL',
      maxValue: maxValue,
      color: Colors.orange.shade600,
      animationValue: _animation.value,
      availableHeight: availableHeight,
      displayValue: widget.glucoseMgDl,
      displayTarget: widget.glucoseTarget,
    );
  }

  Widget _buildBhbBar(double availableHeight) {
    // BHB scale: 0-5 mmol/L
    double maxValue = 5.0;
    double normalizedValue = widget.bhbMmol.clamp(0, maxValue);
    double normalizedTarget = widget.bhbTarget.clamp(0, maxValue);

    return _buildMoleculeBar(
      label: 'BHB',
      value: normalizedValue,
      targetValue: normalizedTarget,
      unit: 'mmol/L',
      maxValue: maxValue,
      color: Colors.yellow.shade700,
      animationValue: _animation.value,
      availableHeight: availableHeight,
      displayValue: widget.bhbMmol,
      displayTarget: widget.bhbTarget,
    );
  }

  Widget _buildGkiBar(double availableHeight) {
    // GKI scale: 0-10
    double maxValue = 10.0;
    double normalizedValue = widget.gki.clamp(0, maxValue);
    double normalizedTarget = widget.gkiTarget.clamp(0, maxValue);

    return _buildMoleculeBar(
      label: 'GKI',
      value: normalizedValue,
      targetValue: normalizedTarget,
      unit: '',
      maxValue: maxValue,
      color: Colors.blue.shade600,
      animationValue: _animation.value,
      availableHeight: availableHeight,
      displayValue: widget.gki,
      displayTarget: widget.gkiTarget,
    );
  }

  Widget _buildMoleculeBar({
    required String label,
    required double value,
    required double targetValue,
    required String unit,
    required double maxValue,
    required Color color,
    required double animationValue,
    required double availableHeight,
    required double displayValue,
    required double displayTarget,
  }) {
    double barHeight = (value / maxValue) * availableHeight * animationValue;
    double targetHeight = (targetValue / maxValue) * availableHeight;

    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Values on top
            if (widget.showValues && availableHeight > 60) ...[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 3),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _formatDisplayValue(displayValue, unit),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: color,
                        fontSize: 10,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (targetValue > 0) ...[
                      Text(
                        _getStatusText(displayValue, displayTarget, label),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: _getStatusColor(
                            displayValue,
                            displayTarget,
                            label,
                          ),
                          fontSize: 8,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 2),
            ],

            // Bar container
            Flexible(
              child: Container(
                width: 45,
                height: availableHeight * 0.75,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    // Target line
                    if (widget.showTargetLines && targetValue > 0)
                      Positioned(
                        bottom: targetHeight * 0.75,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 3,
                          decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(1.5),
                          ),
                        ),
                      ),

                    // Actual bar
                    Container(
                      width: 45,
                      height: barHeight * 0.75,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [color.withOpacity(0.7), color],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 6),

            // Label
            Text(
              label.toUpperCase(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimaryColor,
                fontSize: 11,
              ),
            ),

            // Unit
            if (unit.isNotEmpty && availableHeight > 60)
              Text(
                '($unit)',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.textSecondaryColor,
                  fontSize: 8,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegend() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildLegendItem(
            'Glucose',
            Colors.orange.shade600,
            widget.glucoseMgDl,
            'mg/dL',
          ),
          _buildLegendItem(
            'BHB',
            Colors.yellow.shade700,
            widget.bhbMmol,
            'mmol/L',
          ),
          _buildLegendItem('GKI', Colors.blue.shade600, widget.gki, ''),
        ],
      ),
    );
  }

  Widget _buildLegendItem(
    String label,
    Color color,
    double value,
    String unit,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
            const SizedBox(width: 3),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Text(
          _formatDisplayValue(value, unit),
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 9,
            color: AppTheme.textSecondaryColor,
          ),
        ),
      ],
    );
  }

  String _formatDisplayValue(double value, String unit) {
    if (unit == 'mmol/L' || unit.isEmpty) {
      return '${value.toStringAsFixed(1)}${unit.isNotEmpty ? ' $unit' : ''}';
    } else {
      return '${value.toStringAsFixed(0)} $unit';
    }
  }

  String _getStatusText(double value, double target, String label) {
    switch (label) {
      case 'Glucose':
        if (value <= 100) return 'Optimal';
        if (value <= 125) return 'Good';
        return 'High';
      case 'BHB':
        if (value >= 0.5 && value <= 3.0) return 'Ketosis';
        if (value < 0.5) return 'Low';
        return 'High';
      case 'GKI':
        if (value <= 1.0) return 'Optimal';
        if (value <= 3.0) return 'Good';
        return 'High';
      default:
        return '';
    }
  }

  Color _getStatusColor(double value, double target, String label) {
    switch (label) {
      case 'Glucose':
        if (value <= 100) return Colors.green;
        if (value <= 125) return Colors.orange;
        return Colors.red;
      case 'BHB':
        if (value >= 0.5 && value <= 3.0) return Colors.green;
        return Colors.orange;
      case 'GKI':
        if (value <= 1.0) return Colors.green;
        if (value <= 3.0) return Colors.orange;
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  void _showMoleculeInfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Biomarker Guide'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('🩸 Glucose (mg/dL)'),
            Text('  • Optimal: ≤100'),
            Text('  • Good: 100-125'),
            Text('  • High: >125'),
            SizedBox(height: 8),
            Text('⚡ BHB (mmol/L)'),
            Text('  • Ketosis: 0.5-3.0'),
            Text('  • Higher = deeper ketosis'),
            SizedBox(height: 8),
            Text('📊 GKI (Glucose-Ketone Index)'),
            Text('  • Optimal: ≤1.0'),
            Text('  • Good: 1.0-3.0'),
            Text('  • Lower = better metabolic state'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }
}
