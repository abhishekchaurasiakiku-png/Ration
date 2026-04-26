import 'package:flutter/material.dart';

import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_textfield.dart';
import 'upload_widget.dart';

class ComplaintForm extends StatelessWidget {
  const ComplaintForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ComplaintSummaryCard(),
        const SizedBox(height: 16),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: _cardDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Complaint Details',
                style: TextStyle(
                  color: Color(0xFF172033),
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 16),
              const CustomTextField(
                label: 'Category',
                hintText: 'Delivery, quality, stock, payment',
                prefixIcon: Icons.category_outlined,
              ),
              const SizedBox(height: 12),
              const CustomTextField(
                label: 'Description',
                hintText: 'Describe the issue',
                maxLines: 4,
                prefixIcon: Icons.notes_outlined,
              ),
              const SizedBox(height: 12),
              const UploadWidget(),
              const SizedBox(height: 20),
              CustomButton(
                label: 'Submit Complaint',
                icon: Icons.send_outlined,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Complaint submitted')),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const _ComplaintStatusTile(
          title: 'Delivery delayed',
          status: 'Pending',
          color: Color(0xFFF36B09),
        ),
        const SizedBox(height: 10),
        const _ComplaintStatusTile(
          title: 'Stock quality issue',
          status: 'Resolved',
          color: Color(0xFF1D8D35),
        ),
      ],
    );
  }
}

class _ComplaintSummaryCard extends StatelessWidget {
  const _ComplaintSummaryCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: const Row(
        children: [
          Icon(Icons.support_agent, color: Color(0xFF226BBF), size: 36),
          SizedBox(width: 14),
          Expanded(
            child: Text(
              'Raise complaints for ration delivery, stock availability, dealer behavior, or payment issues.',
              style: TextStyle(color: Color(0xFF5E6B82), height: 1.35),
            ),
          ),
        ],
      ),
    );
  }
}

class _ComplaintStatusTile extends StatelessWidget {
  const _ComplaintStatusTile({
    required this.title,
    required this.status,
    required this.color,
  });

  final String title;
  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.assignment_outlined, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF172033),
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              status,
              style: TextStyle(color: color, fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}

BoxDecoration _cardDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(18),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.08),
        blurRadius: 10,
        offset: const Offset(0, 3),
      ),
    ],
  );
}
