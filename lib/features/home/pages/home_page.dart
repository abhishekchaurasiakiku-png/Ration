import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/widgets/responsive_content.dart';
import '../../navigation/bottom_nav.dart';
import '../widgets/dashboard_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _BeneficiaryHeader(),
              ResponsiveContent(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 20),
                child: DashboardSection(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(currentIndex: 0),
    );
  }
}

class _BeneficiaryHeader extends StatelessWidget {
  const _BeneficiaryHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 34, 20, 26),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2E923D), Color(0xFF126C26)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const ResponsiveContent(
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white24,
              child: Icon(Icons.account_circle, color: Colors.white, size: 28),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Beneficiary Dashboard',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  SizedBox(height: 3),
                  Text(
                    'Hello, Ankit',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white24,
              child: Icon(Icons.more_vert, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
