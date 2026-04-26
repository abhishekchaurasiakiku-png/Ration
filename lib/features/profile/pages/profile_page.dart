import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/widgets/responsive_content.dart';
import '../../navigation/bottom_nav.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ResponsiveContent(child: _BeneficiaryList()),
        ),
      ),
      bottomNavigationBar: BottomNav(currentIndex: 2),
    );
  }
}

class _BeneficiaryList extends StatelessWidget {
  const _BeneficiaryList();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'Beneficiaries',
          style: TextStyle(
            color: Color(0xFF172033),
            fontSize: 26,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 16),
        _SearchBox(),
        SizedBox(height: 14),
        _FilterChips(),
        SizedBox(height: 16),
        _BeneficiaryTile(
          initials: 'VS',
          name: 'Vinod Singh',
          aadhaar: '345678901233',
          card: 'RC0004',
          district: 'District C',
          status: 'verified',
          color: Color(0xFF1D8D35),
        ),
        _BeneficiaryTile(
          initials: 'AS',
          name: 'Anil Sharma',
          aadhaar: '123456789011',
          card: 'RC0002',
          district: 'District A',
          status: 'verified',
          color: Color(0xFF1D8D35),
        ),
        _BeneficiaryTile(
          initials: 'SD',
          name: 'Sunita Devi',
          aadhaar: '234567890122',
          card: 'RC0003',
          district: 'District B',
          status: 'ghost',
          color: Color(0xFFD45218),
        ),
        _BeneficiaryTile(
          initials: 'RP',
          name: 'Ankit',
          aadhaar: '987654321099',
          card: 'RC0001',
          district: 'District A',
          status: 'verified',
          color: Color(0xFF1D8D35),
        ),
        _BeneficiaryTile(
          initials: 'MK',
          name: 'Meena Kumari',
          aadhaar: '455678901244',
          card: 'RC0005',
          district: 'District A',
          status: 'duplicate',
          color: Color(0xFFC81E3A),
        ),
      ],
    );
  }
}

class _SearchBox extends StatelessWidget {
  const _SearchBox();

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search by Name or Ration Card...',
        prefixIcon: const Icon(Icons.search, color: Color(0xFF172033)),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDDE6F3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFDDE6F3)),
        ),
      ),
    );
  }
}

class _FilterChips extends StatelessWidget {
  const _FilterChips();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _FilterChip(label: 'All', selected: true),
          _FilterChip(label: 'Verified'),
          _FilterChip(label: 'Ghost'),
          _FilterChip(label: 'Duplicate'),
          _FilterChip(label: 'Pending'),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, this.selected = false});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Chip(
        avatar: selected
            ? const Icon(Icons.check, color: Color(0xFF226BBF), size: 18)
            : null,
        label: Text(label),
        backgroundColor: selected ? const Color(0xFFDCEEFF) : Colors.white,
        side: BorderSide(
          color: selected ? const Color(0xFFDCEEFF) : const Color(0xFFC8D0DC),
        ),
        labelStyle: TextStyle(
          color: selected ? const Color(0xFF172033) : const Color(0xFF3B4252),
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

class _BeneficiaryTile extends StatelessWidget {
  const _BeneficiaryTile({
    required this.initials,
    required this.name,
    required this.aadhaar,
    required this.card,
    required this.district,
    required this.status,
    required this.color,
  });

  final String initials;
  final String name;
  final String aadhaar;
  final String card;
  final String district;
  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: const Color(0xFFE4F0FF),
            child: Text(
              initials,
              style: const TextStyle(
                color: Color(0xFF226BBF),
                fontWeight: FontWeight.w800,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF111827),
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  aadhaar,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Color(0xFF637395)),
                ),
                const SizedBox(height: 3),
                Text(
                  'Card: $card · $district',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF637395),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.10),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: color.withValues(alpha: 0.35)),
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
