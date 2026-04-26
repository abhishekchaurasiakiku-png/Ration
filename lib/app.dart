import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'routes/app_routes.dart';
import 'routes/route_generator.dart';

class RationApp extends StatelessWidget {
  const RationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ration Distribution',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.login,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
