import 'package:flutter/material.dart';

import '../../../core/widgets/responsive_content.dart';
import '../../../routes/app_routes.dart';
import '../widgets/complaint_section.dart';
import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                const _AppHeader(),
                const SizedBox(height: 36),
                const _AuthTabs(),
                const SizedBox(height: 28),
                Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: const Color(0xFF101A3D),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 24),
                const LoginForm(),
                const SizedBox(height: 28),
                const _DemoCredentials(),
                const SizedBox(height: 18),
                const ComplaintSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AppHeader extends StatelessWidget {
  const _AppHeader();

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
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF226BBF).withValues(alpha: 0.2),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
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
        Text(
          'Digital Public Distribution System',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: const Color(0xFF637395),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _AuthTabs extends StatelessWidget {
  const _AuthTabs();

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
                'Login',
                style: TextStyle(
                  color: Color(0xFF1764B7),
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.register),
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF52637F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
              child: const Text(
                'Register',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DemoCredentials extends StatelessWidget {
  const _DemoCredentials();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFDDE6F3), width: 1.5),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.vpn_key, color: Color(0xFF596986), size: 18),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Demo Credentials - tap to auto-fill',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xFF53647F),
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 14),
          _CredentialTile(
            title: 'Admin',
            email: 'admin@pds.com',
            password: 'admin123',
            icon: Icons.admin_panel_settings,
            color: Color(0xFF1F6BC5),
            background: Color(0xFFE8F2FF),
            border: Color(0xFFBFD8F4),
          ),
          SizedBox(height: 10),
          _CredentialTile(
            title: 'Dealer',
            email: 'dealer@pds.com',
            password: 'dealer123',
            icon: Icons.store,
            color: Color(0xFF178C2F),
            background: Color(0xFFECF8EF),
            border: Color(0xFFC7E6CD),
          ),
          SizedBox(height: 10),
          _CredentialTile(
            title: 'Beneficiary',
            email: 'ankit@pds.com',
            password: 'beneficiary123',
            icon: Icons.person,
            color: Color(0xFF7B1EB1),
            background: Color(0xFFF1EAFB),
            border: Color(0xFFD9C2ED),
          ),
        ],
      ),
    );
  }
}

class _CredentialTile extends StatelessWidget {
  const _CredentialTile({
    required this.title,
    required this.email,
    required this.password,
    required this.icon,
    required this.color,
    required this.background,
    required this.border,
  });

  final String title;
  final String email;
  final String password;
  final IconData icon;
  final Color color;
  final Color background;
  final Color border;

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).width < 380;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 12 : 16,
        vertical: 13,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(11),
        border: Border.all(color: border, width: 1.5),
      ),
      child: compact
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon, color: color, size: 20),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _CredentialTitle(title: title, color: color),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  email,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF38425A),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  password,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF637395),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Icon(icon, color: color, size: 22),
                const SizedBox(width: 14),
                Expanded(
                  child: _CredentialTitle(title: title, color: color),
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        email,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFF38425A),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        password,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFF637395),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}

class _CredentialTitle extends StatelessWidget {
  const _CredentialTitle({required this.title, required this.color});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: color, fontWeight: FontWeight.w800, fontSize: 16),
    );
  }
}
