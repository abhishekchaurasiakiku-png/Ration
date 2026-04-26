import 'package:flutter/material.dart';

import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../../core/widgets/responsive_content.dart';
import '../../../routes/app_routes.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),
      body: SafeArea(
        child: ResponsiveContent(
          maxWidth: 640,
          padding: const EdgeInsets.fromLTRB(20, 42, 20, 32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _RegisterHeader(),
                const SizedBox(height: 36),
                const _RegisterTabs(),
                const SizedBox(height: 28),
                Text(
                  'Create Account',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: const Color(0xFF101A3D),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFDDE6F3)),
                  ),
                  child: Column(
                    children: [
                      const CustomTextField(
                        label: 'Full name',
                        prefixIcon: Icons.person_outline,
                      ),
                      const SizedBox(height: 12),
                      const CustomTextField(
                        label: 'Ration card number',
                        prefixIcon: Icons.badge_outlined,
                      ),
                      const SizedBox(height: 12),
                      const CustomTextField(
                        label: 'Mobile number',
                        keyboardType: TextInputType.phone,
                        prefixIcon: Icons.phone_outlined,
                      ),
                      const SizedBox(height: 12),
                      const CustomTextField(
                        label: 'Password',
                        obscureText: true,
                        prefixIcon: Icons.lock_outline,
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        label: 'Create Account',
                        icon: Icons.person_add_alt_1_outlined,
                        onPressed: () => Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.home,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RegisterHeader extends StatelessWidget {
  const _RegisterHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 92,
          height: 92,
          decoration: BoxDecoration(
            color: const Color(0xFF226BBF),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(Icons.storefront, color: Colors.white, size: 44),
        ),
        const SizedBox(height: 20),
        Text(
          'PDS Tracker',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: const Color(0xFF1263B4),
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'Digital Public Distribution System',
          style: TextStyle(
            color: Color(0xFF637395),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _RegisterTabs extends StatelessWidget {
  const _RegisterTabs();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFE8EEF7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () => Navigator.pop(context),
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF52637F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Text(
                'Register',
                style: TextStyle(
                  color: Color(0xFF1764B7),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
