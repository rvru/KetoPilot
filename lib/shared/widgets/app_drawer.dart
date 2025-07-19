import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../core/constants/app_constants.dart';
import '../../core/themes/app_theme.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                vertical: 2,
              ), // Minimal padding for Dynamic Island devices
              children: [
                _buildNavigationItem(
                  context: context,
                  icon: Icons.dashboard_outlined,
                  selectedIcon: Icons.dashboard,
                  title: 'Dashboard',
                  subtitle: 'Overview & insights',
                  route: '/dashboard',
                ),
                _buildNavigationItem(
                  context: context,
                  icon: Icons.add_circle_outline,
                  selectedIcon: Icons.add_circle,
                  title: 'Add Data',
                  subtitle: 'Log your metrics',
                  route: '/data-entry',
                ),
                _buildNavigationItem(
                  context: context,
                  icon: Icons.restaurant_outlined,
                  selectedIcon: Icons.restaurant,
                  title: 'Food Diary',
                  subtitle: 'Track your meals',
                  route: '/food-diary',
                ),
                _buildNavigationItem(
                  context: context,
                  icon: Icons.favorite_outline,
                  selectedIcon: Icons.favorite,
                  title: 'Health Log',
                  subtitle: 'Symptoms & wellness',
                  route: '/health-logging',
                ),
                _buildNavigationItem(
                  context: context,
                  icon: Icons.analytics_outlined,
                  selectedIcon: Icons.analytics,
                  title: 'Analytics',
                  subtitle: 'Trends & reports',
                  route: '/analytics',
                ),
                _buildNavigationItem(
                  context: context,
                  icon: Icons.calendar_today_outlined,
                  selectedIcon: Icons.calendar_today,
                  title: 'Calendar',
                  subtitle: 'Schedule & reminders',
                  route: '/calendar',
                ),
                const Divider(height: 8), // Reduced from 16 to 8
                _buildSectionHeader('Health Tools'),
                _buildNavigationItem(
                  context: context,
                  icon: Icons.medication_outlined,
                  selectedIcon: Icons.medication,
                  title: 'Medications',
                  subtitle: 'Track supplements',
                  route: '/medications',
                ),
                _buildNavigationItem(
                  context: context,
                  icon: Icons.school_outlined,
                  selectedIcon: Icons.school,
                  title: 'Education',
                  subtitle: 'Learn about ketosis',
                  route: '/education',
                ),
                _buildNavigationItem(
                  context: context,
                  icon: Icons.group_outlined,
                  selectedIcon: Icons.group,
                  title: 'Community',
                  subtitle: 'Connect with others',
                  route: '/community',
                ),
                const Divider(height: 8), // Reduced from 16 to 8
                _buildSectionHeader('Account'),
                _buildNavigationItem(
                  context: context,
                  icon: Icons.person_outline,
                  selectedIcon: Icons.person,
                  title: 'Profile',
                  subtitle: 'Personal information',
                  route: '/profile',
                ),
                _buildNavigationItem(
                  context: context,
                  icon: Icons.settings_outlined,
                  selectedIcon: Icons.settings,
                  title: 'Settings',
                  subtitle: 'App preferences',
                  route: '/settings',
                ),
                const SizedBox(
                  height: 8,
                ), // Added small bottom spacing for better scroll
              ],
            ),
          ),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppTheme.primaryGradient),
      child: SafeArea(
        bottom: false,
        child: Container(
          height: 55, // Fixed height after SafeArea to ensure visibility
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
          child: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: const Icon(
                  Icons.health_and_safety,
                  color: AppTheme.primaryColor,
                  size: 12,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Metabolic Health Companion',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        height: 1.0,
                        fontSize: 10,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 1),
                    Text(
                      'v${AppConstants.appVersion} • John Doe',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 8,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationItem({
    required BuildContext context,
    required IconData icon,
    required IconData selectedIcon,
    required String title,
    required String subtitle,
    required String route,
  }) {
    final isSelected = context.router.current.name.contains(
      route.replaceAll('/', ''),
    );

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 0,
      ), // Reduced margins
      child: ListTile(
        dense: true,
        visualDensity: VisualDensity.compact, // Added for more compactness
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 2,
        ), // Reduced padding
        leading: Container(
          width: 32, // Reduced from 36 to 32
          height: 32, // Reduced from 36 to 32
          decoration: BoxDecoration(
            color: isSelected
                ? AppTheme.primaryColor.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8), // Reduced from 10 to 8
          ),
          child: Icon(
            isSelected ? selectedIcon : icon,
            color: isSelected
                ? AppTheme.primaryColor
                : AppTheme.textSecondaryColor,
            size: 18, // Reduced from 20 to 18
          ),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: isSelected
                ? AppTheme.primaryColor
                : AppTheme.textPrimaryColor,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            fontSize: 14, // Added explicit smaller size
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppTheme.textTertiaryColor,
            fontSize: 10, // Reduced from 11 to 10
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: isSelected
            ? Icon(
                Icons.arrow_forward_ios,
                color: AppTheme.primaryColor,
                size: 12, // Reduced from 14 to 12
              )
            : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ), // Reduced from 10 to 8
        onTap: () {
          Navigator.pop(context);
          if (!isSelected) {
            context.router.pushNamed(route);
          }
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 2,
      ), // Reduced from 4 to 2
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 10, // Reduced from 11 to 10
          fontWeight: FontWeight.w600,
          color: AppTheme.textTertiaryColor,
          letterSpacing: 0.3, // Reduced from 0.5 to 0.3
        ),
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6), // Reduced from 10 to 6
      decoration: BoxDecoration(
        color: AppTheme.backgroundColor,
        border: Border(top: BorderSide(color: AppTheme.dividerColor, width: 1)),
      ),
      child: Row(
        children: [
          Icon(
            Icons.help_outline,
            color: AppTheme.textTertiaryColor,
            size: 14,
          ), // Reduced from 16 to 14
          const SizedBox(width: 3), // Reduced from 4 to 3
          Expanded(
            child: Text(
              'Help & Support',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppTheme.textSecondaryColor,
                fontSize: 11, // Reduced from 12 to 11
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: AppTheme.textTertiaryColor,
            size: 10, // Reduced from 12 to 10
          ),
        ],
      ),
    );
  }
}
