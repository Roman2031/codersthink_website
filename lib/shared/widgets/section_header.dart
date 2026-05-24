import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import 'gradient_text.dart';

class SectionHeader extends StatelessWidget {
  final String label;
  final String title;
  final String? gradientTitle;
  final String? subtitle;
  final CrossAxisAlignment alignment;

  const SectionHeader({
    super.key,
    required this.label,
    required this.title,
    this.gradientTitle,
    this.subtitle,
    this.alignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textAlign = alignment == CrossAxisAlignment.center ? TextAlign.center : TextAlign.left;

    return Column(
      crossAxisAlignment: alignment,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label.toUpperCase(),
            style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white, letterSpacing: 2),
          ),
        ),
        const SizedBox(height: 20),
        if (gradientTitle != null)
          RichText(
            textAlign: textAlign,
            text: TextSpan(
              children: [
                TextSpan(
                  text: title,
                  style: AppTextStyles.displayMedium(context).copyWith(
                    color: isDark ? AppColors.darkText : AppColors.lightText,
                  ),
                ),
                WidgetSpan(
                  child: GradientText(
                    gradientTitle!,
                    style: AppTextStyles.displayMedium(context),
                    textAlign: textAlign,
                  ),
                ),
              ],
            ),
          )
        else
          Text(
            title,
            textAlign: textAlign,
            style: AppTextStyles.displayMedium(context).copyWith(
              color: isDark ? AppColors.darkText : AppColors.lightText,
            ),
          ),
        if (subtitle != null) ...[
          const SizedBox(height: 20),
          Text(
            subtitle!,
            textAlign: textAlign,
            style: AppTextStyles.bodyLarge(context).copyWith(
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
            ),
          ),
        ],
      ],
    );
  }
}
