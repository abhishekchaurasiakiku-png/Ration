import 'package:flutter/material.dart';

import '../../../routes/app_routes.dart';

class ComplaintSection extends StatelessWidget {
  const ComplaintSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFDDE6F3), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.report_problem_outlined,
                color: Color(0xFFB42318),
                size: 22,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Complain Section',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xFF101A3D),
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Raise a complaint about ration delivery, stock availability, dealer service, or payment issues.',
            style: TextStyle(color: Color(0xFF5E6B82), height: 1.35),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 48,
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () =>
                  Navigator.pushNamed(context, AppRoutes.complaint),
              icon: const Icon(Icons.edit_note),
              label: const Text('Complain Now'),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFF226BBF),
                side: const BorderSide(color: Color(0xFF226BBF), width: 1.4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                textStyle: const TextStyle(fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
