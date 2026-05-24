import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/responsive_helper.dart';
import '../../../shared/widgets/animations/fade_in_widget.dart';
import '../../../shared/widgets/gradient_text.dart';
import '../../../shared/widgets/section_header.dart';
import 'widgets/job_card.dart';

class CareersPage extends StatelessWidget {
  const CareersPage({super.key});



  static const _perks = [
    // Add post for job circulers
    // {'icon': '🏠', 'title': 'Remote Friendly', 'desc': 'Work from anywhere in Bangladesh'},
    // {'icon': '📈', 'title': 'Growth Paths', 'desc': 'Clear career progression plans'},
    // {'icon': '💰', 'title': 'Competitive Pay', 'desc': 'Market-leading compensation packages'},
    // {'icon': '🎓', 'title': 'Learning Budget', 'desc': 'Annual education & conference allowance'},
    // {'icon': '🏥', 'title': 'Health Coverage', 'desc': 'Full medical insurance for you & family'},
    // {'icon': '🎉', 'title': 'Team Events', 'desc': 'Regular team retreats and celebrations'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hPad = ResponsiveHelper.horizontalPadding(context);
    final vPad = ResponsiveHelper.sectionPaddingV(context);
    final isMobile = ResponsiveHelper.isMobile(context);

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
          decoration: BoxDecoration(
            gradient: isDark ? AppColors.heroGradient : const LinearGradient(
              colors: [Color(0xFFEEEEFF), Color(0xFFF8F9FF)],
              begin: Alignment.topCenter, end: Alignment.bottomCenter,
            ),
          ),
          child: FadeInWidget(child: Column(children: [
            GradientText('Join Our Team', style: AppTextStyles.displayLarge(context), textAlign: TextAlign.center),
            const SizedBox(height: 20),
            Text(
              'Build the future of digital Bangladesh with us. We\'re always looking for exceptional talent.',
              style: AppTextStyles.bodyXL(context).copyWith(
                  color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
              textAlign: TextAlign.center,
            ),
          ])),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
          child: Column(
            children: [
              FadeInWidget(child: SectionHeader(
                label: 'Life at CodersThink', title: 'Why ', gradientTitle: 'Work With Us?',
                subtitle: 'We\'re more than a company — we\'re a community of builders.',
              )),
              const SizedBox(height: 60),
              LayoutBuilder(builder: (context, constraints) {
                final count = isMobile ? 1 : 3;
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: count, crossAxisSpacing: 20, mainAxisSpacing: 20,
                    childAspectRatio: count == 1 ? 3.5 : 1.6,
                  ),
                  itemCount: _perks.length,
                  itemBuilder: (context, i) {
                    final perk = _perks[i];
                    return FadeInWidget(
                      delay: Duration(milliseconds: 80 * i),
                      child: Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: isDark ? AppColors.darkCard : AppColors.lightCard,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
                        ),
                        child: isMobile
                            ? Row(children: [
                                Text(perk['icon'] as String, style: const TextStyle(fontSize: 28)),
                                const SizedBox(width: 16),
                                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                  Text(perk['title'] as String, style: AppTextStyles.headlineMedium(context).copyWith(fontSize: 15)),
                                  const SizedBox(height: 4),
                                  Text(perk['desc'] as String, style: AppTextStyles.bodyMedium(context).copyWith(
                                      color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary, fontSize: 13)),
                                ])),
                              ])
                            : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                                Text(perk['icon'] as String, style: const TextStyle(fontSize: 32)),
                                const SizedBox(height: 12),
                                Text(perk['title'] as String, style: AppTextStyles.headlineMedium(context).copyWith(fontSize: 16), textAlign: TextAlign.center),
                                const SizedBox(height: 6),
                                Text(perk['desc'] as String, style: AppTextStyles.bodyMedium(context).copyWith(
                                    color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary, fontSize: 13),
                                    textAlign: TextAlign.center, maxLines: 2),
                              ]),
                      ),
                    );
                  },
                );
              }),
              const SizedBox(height: 80),
              FadeInWidget(child: SectionHeader(
                label: 'Open Positions', title: 'We\'re ', gradientTitle: 'Hiring',
                alignment: CrossAxisAlignment.start,
              )),
              const SizedBox(height: 40),
              ...AppConstants.jobs.asMap().entries.map((e) => FadeInWidget(
                delay: Duration(milliseconds: 100 * e.key),
                child: Padding(padding: const EdgeInsets.only(bottom: 16), child: JobCard(job: e.value)),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
