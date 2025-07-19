import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/themes/app_theme.dart';
import '../widgets/macro_bars_widget.dart';

@RoutePage()
class FoodDiaryPage extends StatefulWidget {
  const FoodDiaryPage({super.key});

  @override
  State<FoodDiaryPage> createState() => _FoodDiaryPageState();
}

class _FoodDiaryPageState extends State<FoodDiaryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  DateTime _selectedDate = DateTime.now();

  // Sample data - in real app this would come from state management
  final double _carbsConsumed = 15.0;
  final double _proteinConsumed = 85.0;
  final double _fatConsumed = 120.0;
  final double _carbsLimit = 20.0; // Changed to limit for carbs
  final double _proteinGoal = 100.0; // Changed to goal for protein
  final double _fatGoal = 150.0; // Changed to goal for fat

  final List<_FoodEntryData> _todaysEntries = [
    _FoodEntryData(
      name: 'Avocado',
      mealType: 'Breakfast',
      carbs: 4.0,
      protein: 2.0,
      fat: 15.0,
      calories: 160,
      time: '8:30 AM',
    ),
    _FoodEntryData(
      name: 'Eggs (2 large)',
      mealType: 'Breakfast',
      carbs: 1.0,
      protein: 12.0,
      fat: 10.0,
      calories: 140,
      time: '8:30 AM',
    ),
    _FoodEntryData(
      name: 'Chicken Breast',
      mealType: 'Lunch',
      carbs: 0.0,
      protein: 54.0,
      fat: 3.0,
      calories: 231,
      time: '12:30 PM',
    ),
    _FoodEntryData(
      name: 'Olive Oil',
      mealType: 'Lunch',
      carbs: 0.0,
      protein: 0.0,
      fat: 14.0,
      calories: 120,
      time: '12:30 PM',
    ),
    _FoodEntryData(
      name: 'Spinach Salad',
      mealType: 'Lunch',
      carbs: 3.0,
      protein: 3.0,
      fat: 0.0,
      calories: 23,
      time: '12:30 PM',
    ),
    _FoodEntryData(
      name: 'Almonds',
      mealType: 'Snack',
      carbs: 6.0,
      protein: 14.0,
      fat: 37.0,
      calories: 413,
      time: '3:00 PM',
    ),
    _FoodEntryData(
      name: 'Salmon',
      mealType: 'Dinner',
      carbs: 0.0,
      protein: 25.0,
      fat: 12.0,
      calories: 208,
      time: '7:00 PM',
    ),
    _FoodEntryData(
      name: 'Broccoli',
      mealType: 'Dinner',
      carbs: 6.0,
      protein: 3.0,
      fat: 0.0,
      calories: 34,
      time: '7:00 PM',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Diary'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () => _selectDate(),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _searchFood(),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(text: 'Today', icon: Icon(Icons.today)),
            Tab(text: 'History', icon: Icon(Icons.history)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildTodayTab(), _buildHistoryTab()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addFood(),
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTodayTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildDateSelector(),
          MacroBarsWidget(
            carbsGrams: _carbsConsumed,
            proteinGrams: _proteinConsumed,
            fatGrams: _fatConsumed,
            carbsLimit: _carbsLimit,
            proteinGoal: _proteinGoal,
            fatGoal: _fatGoal,
          ),
          _buildMacroSummary(),
          _buildMealSections(),
        ],
      ),
    );
  }

  Widget _buildHistoryTab() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'History View',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Coming soon! View your historical food data and trends.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelector() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: AppTheme.cardGradient,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.calendar_today, color: AppTheme.primaryColor),
          const SizedBox(width: 12),
          Text(
            _formatDate(_selectedDate),
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          if (_isToday(_selectedDate))
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                'Today',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMacroSummary() {
    double totalCalories = _todaysEntries.fold(
      0,
      (sum, entry) => sum + entry.calories,
    );
    double netCarbs = _carbsConsumed - 8.0; // Assuming 8g fiber

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildMacroSummaryItem(
            'Calories',
            totalCalories.toStringAsFixed(0),
            'kcal',
          ),
          _buildMacroSummaryItem('Net Carbs', netCarbs.toStringAsFixed(1), 'g'),
          _buildMacroSummaryItem('Fiber', '8.0', 'g'),
        ],
      ),
    );
  }

  Widget _buildMacroSummaryItem(String label, String value, String unit) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
        ),
        Text(
          unit,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(color: AppTheme.textSecondaryColor),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildMealSections() {
    final mealTypes = ['Breakfast', 'Lunch', 'Dinner', 'Snack'];

    return Column(
      children: mealTypes.map((mealType) {
        final mealEntries = _todaysEntries
            .where((entry) => entry.mealType == mealType)
            .toList();
        return _buildMealSection(mealType, mealEntries);
      }).toList(),
    );
  }

  Widget _buildMealSection(String mealType, List<_FoodEntryData> entries) {
    double totalCarbs = entries.fold(0, (sum, entry) => sum + entry.carbs);
    double totalProtein = entries.fold(0, (sum, entry) => sum + entry.protein);
    double totalFat = entries.fold(0, (sum, entry) => sum + entry.fat);
    double totalCalories = entries.fold(
      0,
      (sum, entry) => sum + entry.calories,
    );

    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Icon(_getMealIcon(mealType), color: AppTheme.primaryColor),
                const SizedBox(width: 8),
                Text(
                  mealType,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                if (entries.isNotEmpty)
                  Text(
                    '${totalCalories.toStringAsFixed(0)} cal',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppTheme.textSecondaryColor,
                    ),
                  ),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () => _addFoodToMeal(mealType),
                ),
              ],
            ),
          ),
          if (entries.isEmpty)
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'No foods logged for $mealType',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textSecondaryColor,
                ),
              ),
            )
          else
            ...entries.map((entry) => _buildFoodEntry(entry)),
          if (entries.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMacroTotal('C', totalCarbs, Colors.orange),
                  _buildMacroTotal('P', totalProtein, Colors.blue),
                  _buildMacroTotal('F', totalFat, Colors.green),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFoodEntry(_FoodEntryData entry) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppTheme.dividerColor, width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.name,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 4),
                Text(
                  entry.time,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.textSecondaryColor,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${entry.calories.toStringAsFixed(0)} cal',
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 4),
              Text(
                'C:${entry.carbs.toStringAsFixed(0)}g P:${entry.protein.toStringAsFixed(0)}g F:${entry.fat.toStringAsFixed(0)}g',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.textSecondaryColor,
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () => _editFoodEntry(entry),
          ),
        ],
      ),
    );
  }

  Widget _buildMacroTotal(String label, double value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          '${value.toStringAsFixed(0)}g',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  IconData _getMealIcon(String mealType) {
    switch (mealType) {
      case 'Breakfast':
        return Icons.free_breakfast;
      case 'Lunch':
        return Icons.lunch_dining;
      case 'Dinner':
        return Icons.dinner_dining;
      case 'Snack':
        return Icons.cookie;
      default:
        return Icons.restaurant;
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date).inDays;

    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Yesterday';
    } else if (difference < 7) {
      return '${difference} days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  Future<void> _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      setState(() {
        _selectedDate = date;
      });
    }
  }

  void _searchFood() {
    // TODO: Implement food search
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Food search coming soon!'),
        backgroundColor: AppTheme.infoColor,
      ),
    );
  }

  void _addFood() {
    // TODO: Implement add food functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Add food functionality coming soon!'),
        backgroundColor: AppTheme.infoColor,
      ),
    );
  }

  void _addFoodToMeal(String mealType) {
    // TODO: Implement add food to specific meal
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Add food to $mealType coming soon!'),
        backgroundColor: AppTheme.infoColor,
      ),
    );
  }

  void _editFoodEntry(_FoodEntryData entry) {
    // TODO: Implement edit food entry
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Edit ${entry.name} coming soon!'),
        backgroundColor: AppTheme.infoColor,
      ),
    );
  }
}

class _FoodEntryData {
  final String name;
  final String mealType;
  final double carbs;
  final double protein;
  final double fat;
  final double calories;
  final String time;

  _FoodEntryData({
    required this.name,
    required this.mealType,
    required this.carbs,
    required this.protein,
    required this.fat,
    required this.calories,
    required this.time,
  });
}
