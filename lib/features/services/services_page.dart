import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/responsive_helper.dart';
import '../../../shared/widgets/animations/fade_in_widget.dart';
import '../../../shared/widgets/gradient_text.dart';
import 'widgets/service_card.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

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
            child: Column(children: [
              GradientText('Our Services', style: AppTextStyles.displayLarge(context), textAlign: TextAlign.center),
              const SizedBox(height: 20),
              Text(
                'Five specialized software products designed to transform how organizations operate.',
                style: AppTextStyles.bodyXL(context).copyWith(
                    color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
                textAlign: TextAlign.center,
              ),
            ]),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
          child: Column(
            children: AppConstants.services.asMap().entries.map((entry) {
              return FadeInWidget(
                delay: Duration(milliseconds: 80 * entry.key),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: ServiceCard(service: entry.value, reversed: entry.key.isOdd),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
