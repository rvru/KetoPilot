import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/data_entry/presentation/pages/data_entry_page.dart';
import '../../features/food_diary/presentation/pages/food_diary_page.dart';
import '../../features/health_logging/presentation/pages/health_logging_page.dart';
import '../../features/onboarding/presentation/pages/onboarding_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    // Onboarding route
    AutoRoute(page: OnboardingRoute.page, path: '/onboarding', initial: true),

    // Main app routes
    AutoRoute(page: DashboardRoute.page, path: '/dashboard'),

    AutoRoute(page: DataEntryRoute.page, path: '/data-entry'),

    AutoRoute(page: FoodDiaryRoute.page, path: '/food-diary'),

    AutoRoute(page: HealthLoggingRoute.page, path: '/health-logging'),

    AutoRoute(page: SettingsRoute.page, path: '/settings'),
  ];
}
