import 'package:flutter/material.dart';

class DashboardSection extends StatelessWidget {
  const DashboardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _RationCard(),
        SizedBox(height: 16),
        _CollectionOverviewCard(),
        SizedBox(height: 16),
        _MonthlyEntitlementCard(),
        SizedBox(height: 22),
        Text(
          'Distribution History',
          style: TextStyle(
            color: Color(0xFF172033),
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 12),
        _HistoryTile(quantity: '12 kg received', date: 'Jan 2026'),
        SizedBox(height: 10),
        _HistoryTile(quantity: '9 kg received', date: 'Jan 2026'),
      ],
    );
  }
}

class _RationCard extends StatelessWidget {
  const _RationCard();

  @override
  Widget build(BuildContext context) {
    return _VideoCard(
      padding: EdgeInsets.zero,
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF1D8D35), Color(0xFF0F6B28)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _GovIcon(),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PUBLIC DISTRIBUTION SYSTEM',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Ration Card',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  const _VerifiedBadge(),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Ankit',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'District A',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white70, fontSize: 15),
              ),
              const SizedBox(height: 18),
              const Divider(color: Colors.white30),
              const SizedBox(height: 14),
              LayoutBuilder(
                builder: (context, constraints) {
                  final compact = constraints.maxWidth < 340;
                  final children = const [
                    _CardMeta(label: 'Card No.', value: 'RC0001'),
                    _CardMeta(label: 'Family Size', value: '5 Members'),
                  ];

                  if (compact) {
                    return const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _CardMeta(label: 'Card No.', value: 'RC0001'),
                        SizedBox(height: 12),
                        _CardMeta(label: 'Family Size', value: '5 Members'),
                      ],
                    );
                  }

                  return Row(
                    children: [
                      for (final child in children) Expanded(child: child),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GovIcon extends StatelessWidget {
  const _GovIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white24),
      ),
      child: const Icon(Icons.account_balance, color: Colors.white, size: 27),
    );
  }
}

class _VerifiedBadge extends StatelessWidget {
  const _VerifiedBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.20),
        borderRadius: BorderRadius.circular(18),
      ),
      child: const Text(
        'VERIFIED',
        style: TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _CardMeta extends StatelessWidget {
  const _CardMeta({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white70)),
        const SizedBox(height: 4),
        Text(
          value,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}

class _CollectionOverviewCard extends StatelessWidget {
  const _CollectionOverviewCard();

  @override
  Widget build(BuildContext context) {
    return _VideoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle(
            title: 'Monthly Ration Collection',
            subtitle: 'Government entitlement usage for April 2026',
            chip: 'Live',
          ),
          const SizedBox(height: 18),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 620;
              final spacing = isWide ? 12.0 : 10.0;
              final itemWidth = isWide
                  ? (constraints.maxWidth - spacing) / 2
                  : constraints.maxWidth;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: [
                  _CommodityCard(
                    width: itemWidth,
                    name: 'Wheat',
                    unit: 'kg',
                    allocated: 15,
                    collected: 10,
                    color: const Color(0xFFD96A12),
                    paleColor: const Color(0xFFFFF2E8),
                    icon: Icons.grain,
                  ),
                  _CommodityCard(
                    width: itemWidth,
                    name: 'Rice',
                    unit: 'kg',
                    allocated: 10,
                    collected: 7,
                    color: const Color(0xFF226BBF),
                    paleColor: const Color(0xFFEAF4FF),
                    icon: Icons.rice_bowl,
                  ),
                  _CommodityCard(
                    width: itemWidth,
                    name: 'Sugar',
                    unit: 'kg',
                    allocated: 5,
                    collected: 3,
                    color: const Color(0xFF8B16B5),
                    paleColor: const Color(0xFFF7EAFD),
                    icon: Icons.water_drop,
                  ),
                  _CommodityCard(
                    width: itemWidth,
                    name: 'Kerosene',
                    unit: 'L',
                    allocated: 1,
                    collected: 1,
                    color: const Color(0xFF1D8D35),
                    paleColor: const Color(0xFFEAF8ED),
                    icon: Icons.local_gas_station,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CommodityCard extends StatelessWidget {
  const _CommodityCard({
    required this.width,
    required this.name,
    required this.unit,
    required this.allocated,
    required this.collected,
    required this.color,
    required this.paleColor,
    required this.icon,
  });

  final double width;
  final String name;
  final String unit;
  final int allocated;
  final int collected;
  final Color color;
  final Color paleColor;
  final IconData icon;

  int get remaining => allocated - collected;

  @override
  Widget build(BuildContext context) {
    final progress = allocated == 0 ? 0.0 : collected / allocated;

    return SizedBox(
      width: width,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: paleColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.16)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: 24),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF172033),
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 9,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Text(
                    '$remaining $unit left',
                    style: TextStyle(
                      color: color,
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '$collected',
                  style: TextStyle(
                    color: color,
                    fontSize: 28,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    '$unit collected',
                    style: const TextStyle(
                      color: Color(0xFF64748B),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(99),
              child: LinearProgressIndicator(
                value: progress.clamp(0, 1),
                minHeight: 9,
                color: color,
                backgroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Entitlement: $allocated $unit',
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF64748B),
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MonthlyEntitlementCard extends StatelessWidget {
  const _MonthlyEntitlementCard();

  @override
  Widget build(BuildContext context) {
    return _VideoCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _SectionTitle(
            title: 'Entitlement Summary',
            subtitle: 'Approved monthly quota under PDS',
          ),
          const SizedBox(height: 18),
          LayoutBuilder(
            builder: (context, constraints) {
              final compact = constraints.maxWidth < 420;
              final itemWidth = compact
                  ? (constraints.maxWidth - 10) / 2
                  : (constraints.maxWidth - 30) / 4;

              return Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _EntitlementItem(
                    width: itemWidth,
                    value: '15 kg',
                    label: 'Wheat',
                    color: const Color(0xFFD96A12),
                  ),
                  _EntitlementItem(
                    width: itemWidth,
                    value: '10 kg',
                    label: 'Rice',
                    color: const Color(0xFF226BBF),
                  ),
                  _EntitlementItem(
                    width: itemWidth,
                    value: '5 kg',
                    label: 'Sugar',
                    color: const Color(0xFF8B16B5),
                  ),
                  _EntitlementItem(
                    width: itemWidth,
                    value: '1 L',
                    label: 'Kerosene',
                    color: const Color(0xFF1D8D35),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _EntitlementItem extends StatelessWidget {
  const _EntitlementItem({
    required this.width,
    required this.value,
    required this.label,
    required this.color,
  });

  final double width;
  final String value;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          children: [
            Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: color,
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Color(0xFF64748B),
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HistoryTile extends StatelessWidget {
  const _HistoryTile({required this.quantity, required this.date});

  final String quantity;
  final String date;

  @override
  Widget build(BuildContext context) {
    return _VideoCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF5FF),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(Icons.local_shipping, color: Color(0xFF2378CE)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  quantity,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF172033),
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'FPS001 · Delivered',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xFF64748B),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            date,
            style: const TextStyle(
              color: Color(0xFF226BBF),
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title, required this.subtitle, this.chip});

  final String title;
  final String subtitle;
  final String? chip;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF172033),
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                style: const TextStyle(color: Color(0xFF64748B), fontSize: 14),
              ),
            ],
          ),
        ),
        if (chip != null) ...[
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF8ED),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              chip!,
              style: const TextStyle(
                color: Color(0xFF1D8D35),
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _VideoCard extends StatelessWidget {
  const _VideoCard({
    required this.child,
    this.padding = const EdgeInsets.all(18),
  });

  final Widget child;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: child,
    );
  }
}
