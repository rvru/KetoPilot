// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DashboardPage(),
      );
    },
    DataEntryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DataEntryPage(),
      );
    },
    FoodDiaryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FoodDiaryPage(),
      );
    },
    HealthLoggingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HealthLoggingPage(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
  };
}

/// generated route for
/// [DashboardPage]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DataEntryPage]
class DataEntryRoute extends PageRouteInfo<void> {
  const DataEntryRoute({List<PageRouteInfo>? children})
      : super(
          DataEntryRoute.name,
          initialChildren: children,
        );

  static const String name = 'DataEntryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FoodDiaryPage]
class FoodDiaryRoute extends PageRouteInfo<void> {
  const FoodDiaryRoute({List<PageRouteInfo>? children})
      : super(
          FoodDiaryRoute.name,
          initialChildren: children,
        );

  static const String name = 'FoodDiaryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HealthLoggingPage]
class HealthLoggingRoute extends PageRouteInfo<void> {
  const HealthLoggingRoute({List<PageRouteInfo>? children})
      : super(
          HealthLoggingRoute.name,
          initialChildren: children,
        );

  static const String name = 'HealthLoggingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingPage]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
