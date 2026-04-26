import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/widgets/responsive_content.dart';
import '../../navigation/bottom_nav.dart';
import '../widgets/complaint_form.dart';

class ComplaintPage extends StatelessWidget {
  const ComplaintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _ComplaintHeader(),
              ResponsiveContent(child: ComplaintForm()),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(currentIndex: 1),
    );
  }
}

class _ComplaintHeader extends StatelessWidget {
  const _ComplaintHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 44, 24, 28),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF2F80ED), Color(0xFF1557B0)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const ResponsiveContent(
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            Icon(Icons.report_problem_outlined, color: Colors.white, size: 28),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Complain Section',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Submit and track PDS service issues',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white70, fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
