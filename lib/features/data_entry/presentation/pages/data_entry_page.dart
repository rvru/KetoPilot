import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../shared/widgets/app_drawer.dart';

@RoutePage()
class DataEntryPage extends StatefulWidget {
  const DataEntryPage({super.key});

  @override
  State<DataEntryPage> createState() => _DataEntryPageState();
}

class _DataEntryPageState extends State<DataEntryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Nutrition controllers
  final TextEditingController _carbsController = TextEditingController();
  final TextEditingController _proteinController = TextEditingController();
  final TextEditingController _fatController = TextEditingController();

  // Biomarker controllers
  final TextEditingController _glucoseController = TextEditingController();
  final TextEditingController _bhbController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _carbsController.dispose();
    _proteinController.dispose();
    _fatController.dispose();
    _glucoseController.dispose();
    _bhbController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Data'),
        backgroundColor: AppTheme.primaryColor,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(icon: Icon(Icons.restaurant), text: 'Nutrition'),
            Tab(icon: Icon(Icons.biotech), text: 'Biomarkers'),
          ],
        ),
      ),
      drawer: const AppDrawer(),
      body: TabBarView(
        controller: _tabController,
        children: [_buildNutritionTab(), _buildBiomarkersTab()],
      ),
    );
  }

  Widget _buildNutritionTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(
            'Daily Macronutrients',
            'Enter your daily macro totals',
            Icons.bar_chart,
          ),
          const SizedBox(height: 16),
          _buildMacroInputSection(),
          const SizedBox(height: 24),
          _buildActionButtons(isNutrition: true),
        ],
      ),
    );
  }

  Widget _buildBiomarkersTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(
            'Daily Biomarkers',
            'Log your metabolic measurements',
            Icons.science,
          ),
          const SizedBox(height: 16),
          _buildBiomarkerInputSection(),
          const SizedBox(height: 24),
          _buildActionButtons(isNutrition: false),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, String subtitle, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.primaryColor.withOpacity(0.1), Colors.transparent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.primaryColor, size: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppTheme.textSecondaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMacroInputSection() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildMacroInputCard(
                'Carbs',
                'grams',
                _carbsController,
                Colors.orange,
                'Limit: 20g',
                Icons.grain,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildMacroInputCard(
                'Protein',
                'grams',
                _proteinController,
                Colors.blue,
                'Goal: 80g',
                Icons.fitness_center,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildMacroInputCard(
                'Fat',
                'grams',
                _fatController,
                Colors.green,
                'Goal: 45g',
                Icons.opacity,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  children: [
                    Icon(Icons.info_outline, color: Colors.grey.shade600),
                    const SizedBox(height: 8),
                    Text(
                      'Gram-focused tracking for optimal ketosis',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBiomarkerInputSection() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildBiomarkerInputCard(
                'Glucose',
                'mg/dL',
                _glucoseController,
                Colors.orange.shade600,
                'Target: <100',
                Icons.water_drop,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildBiomarkerInputCard(
                'BHB',
                'mmol/L',
                _bhbController,
                Colors.yellow.shade700,
                'Target: >0.5',
                Icons.science,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildBiomarkerInputCard(
                'Weight',
                'kg',
                _weightController,
                Colors.blue.shade600,
                'Optional',
                Icons.scale,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppTheme.primaryColor.withOpacity(0.2),
                  ),
                ),
                child: Column(
                  children: [
                    Icon(Icons.calculate, color: AppTheme.primaryColor),
                    const SizedBox(height: 8),
                    Text(
                      'GKI auto-calculated from glucose & BHB',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMacroInputCard(
    String label,
    String unit,
    TextEditingController controller,
    Color color,
    String target,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Text(
                label,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
            ],
            decoration: InputDecoration(
              hintText: '0',
              suffixText: unit,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: color.withOpacity(0.3)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: color, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
            ),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            target,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: color.withOpacity(0.8),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBiomarkerInputCard(
    String label,
    String unit,
    TextEditingController controller,
    Color color,
    String target,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Text(
                label,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
            ],
            decoration: InputDecoration(
              hintText: '0.0',
              suffixText: unit,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: color.withOpacity(0.3)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: color, width: 2),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
            ),
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            target,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: color.withOpacity(0.8),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons({required bool isNutrition}) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => _saveData(isNutrition),
            icon: const Icon(Icons.save),
            label: Text(
              isNutrition ? 'Save Nutrition Data' : 'Save Biomarker Data',
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryColor,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () => _clearData(isNutrition),
            icon: const Icon(Icons.clear),
            label: const Text('Clear All'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _saveData(bool isNutrition) {
    // TODO: Implement actual data saving logic
    String message = isNutrition
        ? 'Nutrition data saved successfully!'
        : 'Biomarker data saved successfully!';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppTheme.primaryColor,
        action: SnackBarAction(
          label: 'View Dashboard',
          textColor: Colors.white,
          onPressed: () => context.router.pushNamed('/dashboard'),
        ),
      ),
    );

    if (isNutrition) {
      _carbsController.clear();
      _proteinController.clear();
      _fatController.clear();
    } else {
      _glucoseController.clear();
      _bhbController.clear();
      _weightController.clear();
    }
  }

  void _clearData(bool isNutrition) {
    if (isNutrition) {
      _carbsController.clear();
      _proteinController.clear();
      _fatController.clear();
    } else {
      _glucoseController.clear();
      _bhbController.clear();
      _weightController.clear();
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('All fields cleared'),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
