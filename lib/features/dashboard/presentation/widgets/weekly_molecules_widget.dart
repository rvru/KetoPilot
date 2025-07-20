import 'package:flutter/material.dart';
import 'package:metabolicapp/core/themes/app_theme.dart';

class WeeklyMoleculesWidget extends StatelessWidget {
  const WeeklyMoleculesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildLegend(),
          const SizedBox(height: 16),
          _buildChart(),
          const SizedBox(height: 16),
          _buildSummary(),
        ],
      ),
    );
  }

  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildLegendItem('Glucose (mg/dL)', Colors.orange.shade400),
        _buildLegendItem('BHB (mmol/L)', Colors.amber.shade600),
        _buildLegendItem('GKI', Colors.blue.shade400),
      ],
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildChart() {
    final weekData = _getWeekData();

    return Container(
      height: 140,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: weekData.map((dayData) {
                return Expanded(child: _buildDayBar(dayData));
              }).toList(),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: weekData.map((dayData) {
              return Expanded(
                child: Text(
                  dayData['day'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildDayBar(Map<String, dynamic> dayData) {
    final double glucose = dayData['glucose'];
    final double bhb = dayData['bhb'];
    final double gki = dayData['gki'];

    // Normalize values for visualization
    final double normalizedGlucose = (glucose / 150 * 80).clamp(4.0, 80.0);
    final double normalizedBhb = (bhb / 3 * 60).clamp(4.0, 60.0);
    final double normalizedGki = (gki / 10 * 100).clamp(4.0, 100.0);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Glucose bar
          Container(
            width: 6,
            height: normalizedGlucose,
            margin: const EdgeInsets.symmetric(horizontal: 1),
            decoration: BoxDecoration(
              color: Colors.orange.shade400,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(height: 2),
          // BHB bar
          Container(
            width: 6,
            height: normalizedBhb,
            margin: const EdgeInsets.symmetric(horizontal: 1),
            decoration: BoxDecoration(
              color: Colors.amber.shade600,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(height: 2),
          // GKI bar
          Container(
            width: 6,
            height: normalizedGki,
            margin: const EdgeInsets.symmetric(horizontal: 1),
            decoration: BoxDecoration(
              color: Colors.blue.shade400,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummary() {
    final weekData = _getWeekData();
    final avgGlucose =
        weekData.map((d) => d['glucose'] as double).reduce((a, b) => a + b) / 7;
    final avgBhb =
        weekData.map((d) => d['bhb'] as double).reduce((a, b) => a + b) / 7;
    final avgGki =
        weekData.map((d) => d['gki'] as double).reduce((a, b) => a + b) / 7;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Weekly Averages',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryColor,
                ),
              ),
              const Spacer(),
              _buildHealthStatus(avgGlucose, avgBhb, avgGki),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _buildSummaryMetric(
                  '${avgGlucose.toStringAsFixed(0)}',
                  'Glucose',
                  Colors.orange.shade400,
                ),
              ),
              Expanded(
                child: _buildSummaryMetric(
                  '${avgBhb.toStringAsFixed(1)}',
                  'BHB',
                  Colors.amber.shade600,
                ),
              ),
              Expanded(
                child: _buildSummaryMetric(
                  '${avgGki.toStringAsFixed(1)}',
                  'GKI',
                  Colors.blue.shade400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHealthStatus(double glucose, double bhb, double gki) {
    String status;
    Color color;

    if (glucose < 100 && bhb > 0.5 && gki < 3) {
      status = 'Optimal';
      color = Colors.green;
    } else if (glucose < 120 && bhb > 0.2 && gki < 6) {
      status = 'Good';
      color = Colors.orange;
    } else {
      status = 'Fair';
      color = Colors.red;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        status,
        style: TextStyle(
          fontSize: 8,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    );
  }

  Widget _buildSummaryMetric(String value, String label, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
      ],
    );
  }

  List<Map<String, dynamic>> _getWeekData() {
    return [
      {'day': 'Mon', 'glucose': 95.0, 'bhb': 1.2, 'gki': 2.1},
      {'day': 'Tue', 'glucose': 88.0, 'bhb': 1.8, 'gki': 1.3},
      {'day': 'Wed', 'glucose': 92.0, 'bhb': 1.5, 'gki': 1.6},
      {'day': 'Thu', 'glucose': 86.0, 'bhb': 2.1, 'gki': 1.1},
      {'day': 'Fri', 'glucose': 98.0, 'bhb': 1.0, 'gki': 2.6},
      {'day': 'Sat', 'glucose': 85.0, 'bhb': 2.3, 'gki': 1.0},
      {'day': 'Sun', 'glucose': 90.0, 'bhb': 1.7, 'gki': 1.4},
    ];
  }
}
