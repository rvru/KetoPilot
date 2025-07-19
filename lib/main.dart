import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/router/app_router.dart';
import 'core/themes/app_theme.dart';

void main() {
  runApp(const ProviderScope(child: MetabolicHealthApp()));
}

class MetabolicHealthApp extends StatelessWidget {
  const MetabolicHealthApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MaterialApp.router(
      title: 'Metabolic Health Companion',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
