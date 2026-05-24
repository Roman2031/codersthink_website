import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/responsive_helper.dart';
import '../../../shared/widgets/animations/fade_in_widget.dart';
import '../../../shared/widgets/gradient_text.dart';
import 'widgets/mission_section.dart';
import 'widgets/values_section.dart';
import 'widgets/team_section.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hPad = ResponsiveHelper.horizontalPadding(context);
    final vPad = ResponsiveHelper.sectionPaddingV(context);

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
          child: FadeInWidget(
            child: Column(
              children: [
                GradientText('About CodersThink', style: AppTextStyles.displayLarge(context), textAlign: TextAlign.center),
                const SizedBox(height: 20),
                Text(
                  'We are a premium software company from Bangladesh,\nbuilding digital solutions that matter.',
                  style: AppTextStyles.bodyXL(context).copyWith(
                      color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        const MissionSection(),
        const ValuesSection(),
        const TeamSection(),
      ],
    );
  }
}
