import 'package:flutter/material.dart';
import '../../../../core/themes/app_theme.dart';

class MacroBarsWidget extends StatefulWidget {
  final double carbsGrams;
  final double proteinGrams;
  final double fatGrams;
  final double carbsLimit; // Changed from target to limit for carbs
  final double proteinGoal; // Changed from target to goal for protein
  final double fatGoal; // Changed from target to goal for fat
  final double maxBarHeight;
  final bool showTargetLines;
  final bool showValues;

  const MacroBarsWidget({
    super.key,
    required this.carbsGrams,
    required this.proteinGrams,
    required this.fatGrams,
    required this.carbsLimit, // Carbs has a limit (not to exceed)
    required this.proteinGoal, // Protein has a goal (target to reach)
    required this.fatGoal, // Fat has a goal (target to reach)
    this.maxBarHeight = 200.0,
    this.showTargetLines = true,
    this.showValues = true,
  });

  @override
  State<MacroBarsWidget> createState() => _MacroBarsWidgetState();
}

class _MacroBarsWidgetState extends State<MacroBarsWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
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
            _buildMacroBars(),
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
        const Icon(Icons.bar_chart, color: AppTheme.primaryColor, size: 20),
        const SizedBox(width: 6),
        Text(
          'Daily Nutrition',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.info_outline, size: 18),
          onPressed: () => _showMacroInfo(),
          padding: const EdgeInsets.all(4),
          constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
        ),
      ],
    );
  }

  Widget _buildMacroBars() {
    // Calculate max value for scaling, include some buffer above limits/goals
    double maxValue = [
      widget.carbsLimit * 1.2,
      widget.proteinGoal * 1.2,
      widget.fatGoal * 1.2,
      widget.carbsGrams,
      widget.proteinGrams,
      widget.fatGrams,
    ].reduce((a, b) => a > b ? a : b);

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            double availableHeight = constraints.maxHeight > 0
                ? constraints.maxHeight.clamp(120.0, widget.maxBarHeight)
                : widget.maxBarHeight * 0.8;

            return SizedBox(
              height: availableHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildCarbsBar(maxValue, availableHeight),
                  _buildProteinBar(maxValue, availableHeight),
                  _buildFatBar(maxValue, availableHeight),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildCarbsBar(double maxValue, double availableHeight) {
    double barHeight =
        (widget.carbsGrams / maxValue) * availableHeight * _animation.value;
    double limitHeight = (widget.carbsLimit / maxValue) * availableHeight;
    bool exceedsLimit = widget.carbsGrams > widget.carbsLimit;
    Color barColor = exceedsLimit ? Colors.red : Colors.orange;

    return _buildMacroBar(
      label: 'Carbs',
      value: widget.carbsGrams,
      targetValue: widget.carbsLimit,
      targetLabel: 'limit',
      maxValue: maxValue,
      baseColor: Colors.orange,
      actualColor: barColor,
      animationValue: _animation.value,
      availableHeight: availableHeight,
      isLimit: true, // This is a limit, not a goal
      exceedsTarget: exceedsLimit,
    );
  }

  Widget _buildProteinBar(double maxValue, double availableHeight) {
    return _buildMacroBar(
      label: 'Protein',
      value: widget.proteinGrams,
      targetValue: widget.proteinGoal,
      targetLabel: 'goal',
      maxValue: maxValue,
      baseColor: Colors.blue,
      actualColor: Colors.blue,
      animationValue: _animation.value,
      availableHeight: availableHeight,
      isLimit: false, // This is a goal
      exceedsTarget: false,
    );
  }

  Widget _buildFatBar(double maxValue, double availableHeight) {
    return _buildMacroBar(
      label: 'Fat',
      value: widget.fatGrams,
      targetValue: widget.fatGoal,
      targetLabel: 'goal',
      maxValue: maxValue,
      baseColor: Colors.green,
      actualColor: Colors.green,
      animationValue: _animation.value,
      availableHeight: availableHeight,
      isLimit: false, // This is a goal
      exceedsTarget: false,
    );
  }

  Widget _buildMacroBar({
    required String label,
    required double value,
    required double targetValue,
    required String targetLabel,
    required double maxValue,
    required Color baseColor,
    required Color actualColor,
    required double animationValue,
    required double availableHeight,
    required bool isLimit,
    required bool exceedsTarget,
  }) {
    double barHeight = (value / maxValue) * availableHeight * animationValue;
    double targetHeight = (targetValue / maxValue) * availableHeight;
    double percentage = targetValue > 0 ? (value / targetValue) * 100 : 0;

    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Values on top
            if (widget.showValues && availableHeight > 100) ...[
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                decoration: BoxDecoration(
                  color: actualColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${value.toStringAsFixed(0)}g',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: actualColor,
                        fontSize: 11,
                      ),
                    ),
                    if (targetValue > 0)
                      Text(
                        '${percentage.toStringAsFixed(0)}%',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: exceedsTarget
                              ? Colors.red
                              : _getPercentageColor(percentage),
                          fontSize: 9,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
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
                    // Target/Limit line
                    if (widget.showTargetLines && targetValue > 0)
                      Positioned(
                        bottom: targetHeight * 0.75,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 3,
                          child: isLimit
                              ? _buildLimitLine(
                                  baseColor,
                                ) // Dotted red line for limits
                              : _buildGoalLine(
                                  baseColor,
                                ), // Solid line for goals
                        ),
                      ),

                    // Actual bar
                    Container(
                      width: 45,
                      height: barHeight * 0.75,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [actualColor.withOpacity(0.7), actualColor],
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

            // Target/Limit value
            if (availableHeight > 80 && targetValue > 0)
              Text(
                '${value.toStringAsFixed(0)} / ${targetValue.toStringAsFixed(0)}g',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.textSecondaryColor,
                  fontSize: 9,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLimitLine(Color color) {
    return CustomPaint(
      painter: DottedLinePainter(color: Colors.red.shade700),
      child: Container(height: 3),
    );
  }

  Widget _buildGoalLine(Color color) {
    return Container(
      height: 3,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(1.5),
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
            'Carbs',
            Colors.orange,
            widget.carbsGrams,
            widget.carbsLimit,
            'limit',
          ),
          _buildLegendItem(
            'Protein',
            Colors.blue,
            widget.proteinGrams,
            widget.proteinGoal,
            'goal',
          ),
          _buildLegendItem(
            'Fat',
            Colors.green,
            widget.fatGrams,
            widget.fatGoal,
            'goal',
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(
    String label,
    Color color,
    double value,
    double target,
    String type,
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
          '${value.toStringAsFixed(0)}g',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 9,
            color: AppTheme.textSecondaryColor,
          ),
        ),
      ],
    );
  }

  Color _getPercentageColor(double percentage) {
    if (percentage >= 85 && percentage <= 115) {
      return Colors.green;
    } else if (percentage >= 70 && percentage <= 130) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  void _showMacroInfo() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Daily Nutrition Guide'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('🍞 Carbs: Stay under your limit for ketosis'),
            Text('🥩 Protein: Reach your goal for muscle maintenance'),
            Text('🥑 Fat: Reach your goal for energy and satiety'),
            SizedBox(height: 12),
            Text('• Red dotted line = Limit (don\'t exceed)'),
            Text('• Solid line = Goal (aim to reach)'),
            Text('• Bar turns red when limit is exceeded'),
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

// Custom painter for dotted limit lines
class DottedLinePainter extends CustomPainter {
  final Color color;

  DottedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    const double dashWidth = 4;
    const double dashSpace = 3;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
