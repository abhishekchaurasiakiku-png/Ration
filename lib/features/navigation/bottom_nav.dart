import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({required this.currentIndex, super.key});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: (index) {
        final route = switch (index) {
          0 => AppRoutes.home,
          1 => AppRoutes.complaint,
          _ => AppRoutes.profile,
        };

        if (ModalRoute.of(context)?.settings.name != route) {
          Navigator.pushReplacementNamed(context, route);
        }
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.dashboard_outlined),
          selectedIcon: Icon(Icons.dashboard),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.report_problem_outlined),
          selectedIcon: Icon(Icons.report_problem),
          label: 'Complain',
        ),
        NavigationDestination(
          icon: Icon(Icons.groups_outlined),
          selectedIcon: Icon(Icons.groups),
          label: 'Beneficiaries',
        ),
      ],
    );
  }
}
