import 'package:flutter/material.dart';
import 'package:metabolicapp/core/themes/app_theme.dart';

class WeeklyNutritionWidget extends StatelessWidget {
  const WeeklyNutritionWidget({super.key});

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
        _buildLegendItem('Carbs', Colors.red.shade400),
        _buildLegendItem('Protein', Colors.blue.shade400),
        _buildLegendItem('Fat', Colors.green.shade400),
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
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
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
    final double carbs = dayData['carbs'];
    final double protein = dayData['protein'];
    final double fat = dayData['fat'];
    final double total = carbs + protein + fat;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 24,
            height: (total / 300 * 100).clamp(4.0, 100.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.red.shade400,
                  Colors.blue.shade400,
                  Colors.green.shade400,
                ],
                stops: [0, carbs / total, (carbs + protein) / total],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummary() {
    final weekData = _getWeekData();
    final avgCarbs =
        weekData.map((d) => d['carbs'] as double).reduce((a, b) => a + b) / 7;
    final avgProtein =
        weekData.map((d) => d['protein'] as double).reduce((a, b) => a + b) / 7;
    final avgFat =
        weekData.map((d) => d['fat'] as double).reduce((a, b) => a + b) / 7;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Weekly Averages',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _buildSummaryMetric(
                  '${avgCarbs.toStringAsFixed(1)}g',
                  'Carbs',
                  Colors.red.shade400,
                ),
              ),
              Expanded(
                child: _buildSummaryMetric(
                  '${avgProtein.toStringAsFixed(1)}g',
                  'Protein',
                  Colors.blue.shade400,
                ),
              ),
              Expanded(
                child: _buildSummaryMetric(
                  '${avgFat.toStringAsFixed(1)}g',
                  'Fat',
                  Colors.green.shade400,
                ),
              ),
            ],
          ),
        ],
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
      {'day': 'Mon', 'carbs': 45.0, 'protein': 85.0, 'fat': 65.0},
      {'day': 'Tue', 'carbs': 52.0, 'protein': 78.0, 'fat': 58.0},
      {'day': 'Wed', 'carbs': 38.0, 'protein': 92.0, 'fat': 72.0},
      {'day': 'Thu', 'carbs': 41.0, 'protein': 88.0, 'fat': 60.0},
      {'day': 'Fri', 'carbs': 47.0, 'protein': 82.0, 'fat': 68.0},
      {'day': 'Sat', 'carbs': 35.0, 'protein': 75.0, 'fat': 55.0},
      {'day': 'Sun', 'carbs': 42.0, 'protein': 80.0, 'fat': 62.0},
    ];
  }
}
