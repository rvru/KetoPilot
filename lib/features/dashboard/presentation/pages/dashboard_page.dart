import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/themes/app_theme.dart';
import '../../../../shared/widgets/app_drawer.dart';
import '../../../food_diary/presentation/widgets/macro_bars_widget.dart';
import '../widgets/molecule_bars_widget.dart';
import '../widgets/swipeable_section_widget.dart';
import '../widgets/weekly_nutrition_widget.dart';
import '../widgets/weekly_molecules_widget.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Show notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // TODO: Show more options
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () async {
          // TODO: Refresh data
          await Future.delayed(const Duration(seconds: 1));
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              _buildWelcomeSection(),
              _buildGkiCard(),
              _buildQuickActionsGrid(),
              _buildMacroPreviewSection(),
              _buildQuickMetricsSection(),
              _buildRecentReadingsSection(),
              _buildEducationSection(),
              const SizedBox(height: 100), // Space for FAB
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
              _navigateToIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            elevation: 0,
            selectedItemColor: AppTheme.primaryColor,
            unselectedItemColor: AppTheme.textSecondaryColor,
            selectedLabelStyle: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Icon(Icons.dashboard_outlined, size: 22),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Icon(Icons.dashboard, size: 22),
                ),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Icon(Icons.restaurant_outlined, size: 22),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Icon(Icons.restaurant, size: 22),
                ),
                label: 'Diary',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Icon(Icons.analytics_outlined, size: 22),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Icon(Icons.analytics, size: 22),
                ),
                label: 'Trends',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Icon(Icons.more_horiz, size: 22),
                ),
                activeIcon: Padding(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Icon(Icons.more_horiz, size: 22),
                ),
                label: 'More',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.pushNamed('/data-entry');
        },
        backgroundColor: AppTheme.primaryColor,
        elevation: 4,
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildWelcomeSection() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppTheme.primaryGradient,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(
                  Icons.waving_hand,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Good Morning, John!',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'How are you feeling today?',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildWelcomeMetric(
                  icon: Icons.local_fire_department,
                  title: 'Streak',
                  value: '12 days',
                  subtitle: 'In ketosis',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildWelcomeMetric(
                  icon: Icons.trending_up,
                  title: 'Progress',
                  value: '85%',
                  subtitle: 'Goal achieved',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeMetric({
    required IconData icon,
    required String title,
    required String value,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 20),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGkiCard() {
    // Mock data - in real app this would come from state management
    const double glucose = 85.0;
    const double ketones = 1.2;
    const double gki = glucose / (ketones * 18.0);

    Color getGkiColor() {
      if (gki <= 3.0) return AppTheme.optimalColor;
      if (gki <= 6.0) return AppTheme.therapeuticColor;
      if (gki <= 9.0) return AppTheme.cautionColor;
      return AppTheme.criticalColor;
    }

    String getGkiStatus() {
      if (gki <= 3.0) return 'Optimal';
      if (gki <= 6.0) return 'Therapeutic';
      if (gki <= 9.0) return 'Moderate';
      return 'High';
    }

    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.analytics, color: AppTheme.primaryColor, size: 24),
                const SizedBox(width: 12),
                Text(
                  'Glucose-Ketone Index',
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.info_outline),
                  onPressed: () {
                    // TODO: Show GKI information
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: getGkiColor(), width: 8),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      gki.toStringAsFixed(1),
                      style: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: getGkiColor(),
                          ),
                    ),
                    Text(
                      getGkiStatus(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: getGkiColor(),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: _buildGkiMetric(
                    icon: Icons.water_drop,
                    label: 'Glucose',
                    value: '${glucose.toStringAsFixed(0)} mg/dL',
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildGkiMetric(
                    icon: Icons.science,
                    label: 'Ketones',
                    value: '${ketones.toStringAsFixed(1)} mmol/L',
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGkiMetric({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: 8),
          Text(
            value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppTheme.textSecondaryColor),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionsGrid() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Actions',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.4,
            children: [
              _buildQuickActionCard(
                icon: Icons.add_circle,
                title: 'Log Data',
                subtitle: 'Add glucose & ketones',
                color: AppTheme.primaryColor,
                onTap: () => context.router.pushNamed('/data-entry'),
              ),
              _buildQuickActionCard(
                icon: Icons.restaurant,
                title: 'Food Diary',
                subtitle: 'Track your meals',
                color: Colors.orange,
                onTap: () => context.router.pushNamed('/food-diary'),
              ),
              _buildQuickActionCard(
                icon: Icons.favorite,
                title: 'Health Log',
                subtitle: 'Log symptoms & wellness',
                color: Colors.red,
                onTap: () => context.router.pushNamed('/health-logging'),
              ),
              _buildQuickActionCard(
                icon: Icons.analytics,
                title: 'Analytics',
                subtitle: 'View trends & insights',
                color: Colors.blue,
                onTap: () {
                  // TODO: Navigate to analytics
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 0,
      color: color.withOpacity(0.1),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(height: 8),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppTheme.textSecondaryColor,
                  fontSize: 11,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMacroPreviewSection() {
    return Column(
      children: [
        // Swipeable Nutrition Section (Daily/Weekly)
        SwipeableSectionWidget(
          title: 'Nutrition',
          dailyWidget: MacroBarsWidget(
            carbsGrams: 11.0, // Example values from the slide
            proteinGrams: 75.0,
            fatGrams: 50.0,
            carbsLimit: 20.0, // Using new parameter names
            proteinGoal: 80.0,
            fatGoal: 45.0,
            maxBarHeight: 120.0,
            showTargetLines: true,
            showValues: true,
          ),
          weeklyWidget: const WeeklyNutritionWidget(),
          actionText: 'Food Diary',
          onActionTap: () => context.router.pushNamed('/food-diary'),
        ),

        const SizedBox(height: 8),

        // Swipeable Molecules Section (Daily/Weekly)
        SwipeableSectionWidget(
          title: 'Biomarkers',
          dailyWidget: MoleculeBarsWidget(
            glucoseMgDl: 85.0, // Example values
            bhbMmol: 1.2,
            gki: 4.1,
            glucoseTarget: 100.0,
            bhbTarget: 1.5,
            gkiTarget: 1.0,
            maxBarHeight: 120.0,
            showTargetLines: true,
            showValues: true,
          ),
          weeklyWidget: const WeeklyMoleculesWidget(),
          actionText: 'Log Data',
          onActionTap: () => context.router.pushNamed('/data-entry'),
        ),
      ],
    );
  }

  Widget _buildQuickMetricsSection() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Today\'s Metrics',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  // TODO: Navigate to full metrics
                },
                child: const Text('View All'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _buildMetricCard(
                  icon: Icons.scale,
                  title: 'Weight',
                  value: '70.5 kg',
                  change: '-0.2 kg',
                  isPositive: false,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _buildMetricCard(
                  icon: Icons.favorite,
                  title: 'Heart Rate',
                  value: '72 bpm',
                  change: '+3 bpm',
                  isPositive: true,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard({
    required IconData icon,
    required String title,
    required String value,
    required String change,
    required bool isPositive,
    required Color color,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 20),
                const Spacer(),
                Icon(
                  isPositive ? Icons.trending_up : Icons.trending_down,
                  color: isPositive ? Colors.green : Colors.red,
                  size: 16,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              value,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppTheme.textSecondaryColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              change,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isPositive ? Colors.green : Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentReadingsSection() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Recent Readings',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  // TODO: Navigate to history
                },
                child: const Text('View All'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return _buildRecentReadingItem(
                time: 'Today, ${8 + index * 2}:00 AM',
                glucose: 85 + (index * 5),
                ketones: 1.2 - (index * 0.1),
                gki: (85 + (index * 5)) / ((1.2 - (index * 0.1)) * 18.0),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRecentReadingItem({
    required String time,
    required double glucose,
    required double ketones,
    required double gki,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: gki <= 3.0
                ? AppTheme.optimalColor
                : AppTheme.therapeuticColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Center(
            child: Text(
              gki.toStringAsFixed(1),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        title: Text(
          time,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          'Glucose: ${glucose.toStringAsFixed(0)} mg/dL • Ketones: ${ketones.toStringAsFixed(1)} mmol/L',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: AppTheme.textSecondaryColor),
        ),
        trailing: Icon(
          gki <= 3.0 ? Icons.check_circle : Icons.info,
          color: gki <= 3.0 ? AppTheme.optimalColor : AppTheme.therapeuticColor,
        ),
      ),
    );
  }

  Widget _buildEducationSection() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Learn More',
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Icon(
                      Icons.school,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Understanding Your GKI',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Learn how to interpret your glucose-ketone index for optimal health.',
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: AppTheme.textSecondaryColor),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: AppTheme.textTertiaryColor,
                    size: 16,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToIndex(int index) {
    switch (index) {
      case 0:
        // Already on dashboard
        break;
      case 1:
        context.router.pushNamed('/food-diary');
        break;
      case 2:
        // TODO: Navigate to trends/analytics
        break;
      case 3:
        context.router.pushNamed('/settings');
        break;
    }
  }
}
