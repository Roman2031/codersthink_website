import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../shared/widgets/animations/fade_in_widget.dart';
import '../../../../shared/widgets/section_header.dart';

class ValuesSection extends StatelessWidget {
  const ValuesSection({super.key});

  static const _values = [
    {'icon': '⚡', 'title': 'Speed', 'desc': 'We ship fast without sacrificing quality. Rapid iteration is our superpower.', 'color': 0xFF6C63FF},
    {'icon': '💎', 'title': 'Quality', 'desc': 'Pixel-perfect UIs and bulletproof backends. We set the bar high.', 'color': 0xFF00D4FF},
    {'icon': '🛡️', 'title': 'Security', 'desc': 'Enterprise-grade security baked into every line of code we write.', 'color': 0xFF10B981},
    {'icon': '🤝', 'title': 'Partnership', 'desc': 'We treat every client as a long-term partner, not just a project.', 'color': 0xFFFF6584},
    {'icon': '🌱', 'title': 'Innovation', 'desc': 'Constantly exploring new technologies to keep clients ahead of the curve.', 'color': 0xFFF59E0B},
    {'icon': '💬', 'title': 'Transparency', 'desc': 'Open communication, honest timelines, and clear pricing — always.', 'color': 0xFF9B94FF},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hPad = ResponsiveHelper.horizontalPadding(context);
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: ResponsiveHelper.sectionPaddingV(context)),
      child: Column(
        children: [
          FadeInWidget(child: SectionHeader(label: 'Core Values', title: 'What ', gradientTitle: 'Drives Us')),
          const SizedBox(height: 60),
          LayoutBuilder(builder: (context, constraints) {
            final count = isMobile ? 1 : (constraints.maxWidth < 900 ? 2 : 3);
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: count, crossAxisSpacing: 20, mainAxisSpacing: 20,
                childAspectRatio: isMobile ? 3 : 1.9,
              ),
              itemCount: _values.length,
              itemBuilder: (context, i) {
                final val = _values[i];
                final color = Color(val['color'] as int);
                return FadeInWidget(
                  delay: Duration(milliseconds: 80 * i),
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.darkCard : AppColors.lightCard,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
                    ),
                    child: Row(children: [
                      Container(
                        width: 48, height: 48,
                        decoration: BoxDecoration(color: color.withOpacity(0.15), borderRadius: BorderRadius.circular(12)),
                        child: Center(child: Text(val['icon'] as String, style: const TextStyle(fontSize: 22))),
                      ),
                      const SizedBox(width: 16),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(val['title'] as String,
                              style: AppTextStyles.headlineMedium(context).copyWith(
                                  color: isDark ? AppColors.darkText : AppColors.lightText, fontSize: 16)),
                          const SizedBox(height: 4),
                          Text(val['desc'] as String,
                              style: AppTextStyles.bodyMedium(context).copyWith(
                                  color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary, fontSize: 13),
                              maxLines: 2, overflow: TextOverflow.ellipsis),
                        ],
                      )),
                    ]),
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}
