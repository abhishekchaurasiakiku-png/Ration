import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    super.key,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
    );
  }
}
