import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../shared/widgets/animations/fade_in_widget.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/section_header.dart';

class TeamSection extends StatelessWidget {
  const TeamSection({super.key});

  @override
  Widget build(BuildContext context) {
    final hPad = ResponsiveHelper.horizontalPadding(context);
    final isMobile = ResponsiveHelper.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: ResponsiveHelper.sectionPaddingV(context)),
      child: Column(
        children: [
          FadeInWidget(child: SectionHeader(
            label: 'The Team', title: 'Meet the ', gradientTitle: 'Builders',
            subtitle: 'A passionate team of engineers, designers, and strategists.',
          )),
          const SizedBox(height: 60),
          LayoutBuilder(builder: (context, constraints) {
            final count = isMobile ? 1 : (constraints.maxWidth < 900 ? 2 : 4);
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: count, crossAxisSpacing: 20, mainAxisSpacing: 20, childAspectRatio: 0.88,
              ),
              itemCount: AppConstants.teamMembers.length,
              itemBuilder: (context, i) {
                final m = AppConstants.teamMembers[i];
                final isDark = Theme.of(context).brightness == Brightness.dark;
                return FadeInWidget(
                  delay: Duration(milliseconds: 100 * i),
                  child: GlassCard(
                    hoverable: true,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Container(
                        width: 80, height: 80,
                        decoration: const BoxDecoration(gradient: AppColors.primaryGradient, shape: BoxShape.circle),
                        child: Center(child: Text(m['emoji']!, style: const TextStyle(fontSize: 36))),
                      ),
                      const SizedBox(height: 16),
                      Text(m['name']!, style: AppTextStyles.headlineMedium(context).copyWith(fontSize: 16), textAlign: TextAlign.center),
                      const SizedBox(height: 4),
                      Text(m['role']!,
                          style: GoogleFonts.inter(fontSize: 13, color: AppColors.primary, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center),
                      const SizedBox(height: 10),
                      Text(m['bio']!,
                          style: GoogleFonts.inter(fontSize: 12, height: 1.5,
                              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
                          textAlign: TextAlign.center),
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
