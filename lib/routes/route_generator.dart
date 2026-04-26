import 'package:flutter/material.dart';

import '../features/auth/pages/login_page.dart';
import '../features/auth/pages/register_page.dart';
import '../features/complaint/pages/complaint_page.dart';
import '../features/home/pages/home_page.dart';
import '../features/profile/pages/profile_page.dart';
import 'app_routes.dart';

class RouteGenerator {
  const RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (_) {
        switch (settings.name) {
          case AppRoutes.login:
            return const LoginPage();
          case AppRoutes.register:
            return const RegisterPage();
          case AppRoutes.home:
            return const HomePage();
          case AppRoutes.complaint:
            return const ComplaintPage();
          case AppRoutes.profile:
            return const ProfilePage();
          default:
            return const LoginPage();
        }
      },
    );
  }
}
