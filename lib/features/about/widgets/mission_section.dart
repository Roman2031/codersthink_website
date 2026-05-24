import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../shared/widgets/animations/fade_in_widget.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/section_header.dart';

class MissionSection extends StatelessWidget {
  const MissionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final hPad = ResponsiveHelper.horizontalPadding(context);
    final vPad = ResponsiveHelper.sectionPaddingV(context);
    final isMobile = ResponsiveHelper.isMobile(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
      child: Column(
        children: [
          FadeInWidget(
            child: SectionHeader(
              label: 'Our Story',
              title: 'Built with ',
              gradientTitle: 'Purpose',
              subtitle: 'Since 2019, CodersThink has been at the forefront of digital transformation in Bangladesh.',
            ),
          ),
          const SizedBox(height: 60),
          isMobile
              ? Column(children: _missionCards(context, isDark).map((w) => Padding(padding: const EdgeInsets.only(bottom: 20), child: w)).toList())
              : Row(
                  children: _missionCards(context, isDark)
                      .map((w) => Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10), child: w)))
                      .toList(),
                ),
        ],
      ),
    );
  }

  List<Widget> _missionCards(BuildContext context, bool isDark) {
    final items = [
      {
        'gradient': AppColors.primaryGradient,
        'icon': Icons.rocket_launch_rounded,
        'title': 'Our Mission',
        'text': 'To empower organizations in Bangladesh with world-class software that is both accessible and transformative — closing the technology gap one solution at a time.',
        'delay': 100,
      },
      {
        'gradient': const LinearGradient(colors: [Color(0xFF00D4FF), Color(0xFF10B981)]),
        'icon': Icons.visibility_rounded,
        'title': 'Our Vision',
        'text': 'To become South Asia\'s most trusted software partner for education, healthcare, and financial institutions — recognized for innovation, quality, and impact.',
        'delay': 200,
      },
      {
        'gradient': const LinearGradient(colors: [Color(0xFFFF6584), Color(0xFF6C63FF)]),
        'icon': Icons.handshake_rounded,
        'title': 'Our Commitment',
        'text': 'Every project we take on is a commitment to excellence. We don\'t just deliver software — we build long-term partnerships, providing support, training, and continuous improvement.',
        'delay': 300,
      },
    ];

    return items.map((item) => FadeInWidget(
      delay: Duration(milliseconds: item['delay'] as int),
      child: GlassCard(
        hoverable: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: item['gradient'] as Gradient,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(item['icon'] as IconData, color: Colors.white, size: 24),
            ),
            const SizedBox(height: 20),
            Text(item['title'] as String,
                style: AppTextStyles.headlineMedium(context).copyWith(
                    color: isDark ? AppColors.darkText : AppColors.lightText)),
            const SizedBox(height: 12),
            Text(item['text'] as String,
                style: AppTextStyles.bodyMedium(context).copyWith(
                    color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary)),
          ],
        ),
      ),
    )).toList();
  }
}
