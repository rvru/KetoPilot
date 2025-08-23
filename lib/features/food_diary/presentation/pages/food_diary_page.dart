import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  // Updated to use DateTime timestamps for chronological ordering
  final List<_FoodEntryData> _todaysEntries = [
    _FoodEntryData(
      name: 'Avocado',
      carbs: 4.0,
      protein: 2.0,
      fat: 15.0,
      calories: 160,
      timestamp: DateTime.now().copyWith(hour: 8, minute: 30, second: 0),
      servingSize: '1 medium',
    ),
    _FoodEntryData(
      name: 'Eggs (2 large)',
      carbs: 1.0,
      protein: 12.0,
      fat: 10.0,
      calories: 140,
      timestamp: DateTime.now().copyWith(hour: 8, minute: 35, second: 0),
      servingSize: '2 large',
    ),
    _FoodEntryData(
      name: 'Chicken Breast',
      carbs: 0.0,
      protein: 54.0,
      fat: 3.0,
      calories: 231,
      timestamp: DateTime.now().copyWith(hour: 12, minute: 30, second: 0),
      servingSize: '200g',
    ),
    _FoodEntryData(
      name: 'Olive Oil',
      carbs: 0.0,
      protein: 0.0,
      fat: 14.0,
      calories: 120,
      timestamp: DateTime.now().copyWith(hour: 12, minute: 32, second: 0),
      servingSize: '1 tbsp',
    ),
    _FoodEntryData(
      name: 'Spinach Salad',
      carbs: 3.0,
      protein: 3.0,
      fat: 0.0,
      calories: 23,
      timestamp: DateTime.now().copyWith(hour: 12, minute: 35, second: 0),
      servingSize: '2 cups',
    ),
    _FoodEntryData(
      name: 'Almonds',
      carbs: 6.0,
      protein: 14.0,
      fat: 37.0,
      calories: 413,
      timestamp: DateTime.now().copyWith(hour: 15, minute: 0, second: 0),
      servingSize: '30g',
    ),
    _FoodEntryData(
      name: 'Salmon',
      carbs: 0.0,
      protein: 25.0,
      fat: 12.0,
      calories: 208,
      timestamp: DateTime.now().copyWith(hour: 19, minute: 0, second: 0),
      servingSize: '150g',
    ),
    _FoodEntryData(
      name: 'Broccoli',
      carbs: 6.0,
      protein: 3.0,
      fat: 0.0,
      calories: 34,
      timestamp: DateTime.now().copyWith(hour: 19, minute: 5, second: 0),
      servingSize: '1 cup',
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
    // Sort entries chronologically
    final sortedEntries = [..._todaysEntries]
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));

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
          _buildQuickAddSection(),
          _buildTimelineHeader(),
          _buildFoodTimeline(sortedEntries),
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

  Widget _buildQuickAddSection() {
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
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () => _addFoodAtTime(DateTime.now()),
              icon: const Icon(Icons.add),
              label: const Text('Add Now'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () => _addFoodAtCustomTime(),
              icon: const Icon(Icons.schedule),
              label: const Text('Custom Time'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.primaryColor,
                side: const BorderSide(color: AppTheme.primaryColor),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineHeader() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.timeline, color: AppTheme.primaryColor, size: 20),
          const SizedBox(width: 8),
          Text(
            'Food Timeline',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
          const Spacer(),
          Text(
            '${_todaysEntries.length} entries',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppTheme.textSecondaryColor),
          ),
        ],
      ),
    );
  }

  Widget _buildFoodTimeline(List<_FoodEntryData> sortedEntries) {
    if (sortedEntries.isEmpty) {
      return Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppTheme.cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            Icon(Icons.restaurant_menu, size: 48, color: Colors.grey.shade400),
            const SizedBox(height: 12),
            Text(
              'No food logged today',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tap "Add Now" to log your first meal',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade500),
            ),
          ],
        ),
      );
    }

    return Column(
      children: sortedEntries.asMap().entries.map((entry) {
        final index = entry.key;
        final foodEntry = entry.value;
        final isLast = index == sortedEntries.length - 1;

        return _buildTimelineEntry(foodEntry, isLast);
      }).toList(),
    );
  }

  Widget _buildTimelineEntry(_FoodEntryData entry, bool isLast) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline indicator
          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryColor.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
              if (!isLast)
                Container(width: 2, height: 80, color: Colors.grey.shade300),
            ],
          ),
          const SizedBox(width: 16),
          // Food entry content
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: isLast ? 16 : 8),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
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
              child: _buildTimelineEntryContent(entry),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineEntryContent(_FoodEntryData entry) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Time and food name
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                DateFormat('h:mm a').format(entry.timestamp),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primaryColor,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.name,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  if (entry.servingSize.isNotEmpty)
                    Text(
                      entry.servingSize,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(
                          context,
                        ).colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit_outlined, size: 20),
              onPressed: () => _editFoodEntry(entry),
              constraints: const BoxConstraints(),
              padding: const EdgeInsets.all(4),
            ),
          ],
        ),
        const SizedBox(height: 12),
        // Macro information
        Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMacroChip('C', entry.carbs, Colors.orange),
                  _buildMacroChip('P', entry.protein, Colors.blue),
                  _buildMacroChip('F', entry.fat, Colors.green),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${entry.calories.toStringAsFixed(0)}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
                ),
                Text(
                  'cal',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppTheme.textSecondaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMacroChip(String label, double value, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            '${value.toStringAsFixed(0)}g',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
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

  void _addFoodAtTime(DateTime time) {
    // TODO: Implement add food at specific time
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Add food at ${DateFormat('h:mm a').format(time)} coming soon!',
        ),
        backgroundColor: AppTheme.infoColor,
      ),
    );
  }

  Future<void> _addFoodAtCustomTime() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      final DateTime customDateTime = DateTime.now().copyWith(
        hour: time.hour,
        minute: time.minute,
        second: 0,
      );
      _addFoodAtTime(customDateTime);
    }
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
  final double carbs;
  final double protein;
  final double fat;
  final double calories;
  final DateTime timestamp;
  final String servingSize;

  _FoodEntryData({
    required this.name,
    required this.carbs,
    required this.protein,
    required this.fat,
    required this.calories,
    required this.timestamp,
    required this.servingSize,
  });
}
