import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../shared/widgets/gradient_button.dart';
import '../../../../shared/widgets/gradient_text.dart';

class ServiceCard extends StatelessWidget {
  final Map<String, dynamic> service;
  final bool reversed;

  const ServiceCard({super.key, required this.service, this.reversed = false});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveHelper.isMobile(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = Color(service['color'] as int);
    final features = service['features'] as List;

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 56, height: 56,
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withOpacity(0.3)),
          ),
          child: Center(child: Text(service['icon'] as String, style: const TextStyle(fontSize: 26))),
        ),
        const SizedBox(height: 24),
        GradientText(
          service['title'] as String,
          style: AppTextStyles.displaySmall(context),
          gradient: LinearGradient(colors: [color, color.withOpacity(0.6)]),
        ),
        const SizedBox(height: 8),
        Text(
          service['subtitle'] as String,
          style: AppTextStyles.headlineMedium(context).copyWith(
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 20),
        Text(
          service['description'] as String,
          style: AppTextStyles.bodyLarge(context).copyWith(
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 10, runSpacing: 10,
          children: features.map((f) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: color.withOpacity(0.2)),
            ),
            child: Text(f as String, style: GoogleFonts.inter(fontSize: 13, color: color, fontWeight: FontWeight.w500)),
          )).toList(),
        ),
        const SizedBox(height: 32),
        GradientButton(label: 'Request a Demo', icon: Icons.arrow_forward_rounded, onPressed: () {}),
      ],
    );

    final visual = Container(
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft, end: Alignment.bottomRight,
          colors: [color.withOpacity(0.18), color.withOpacity(0.05)],
        ),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Column(children: [
        Text(service['icon'] as String, style: const TextStyle(fontSize: 80)),
        const SizedBox(height: 20),
        Text(
          service['title'] as String,
          style: AppTextStyles.headlineLarge(context).copyWith(color: color, fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        ...features.take(4).map((f) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(children: [
            Icon(Icons.check_circle_rounded, color: color, size: 18),
            const SizedBox(width: 10),
            Text(f as String, style: AppTextStyles.bodyMedium(context).copyWith(
                color: isDark ? AppColors.darkText : AppColors.lightText)),
          ]),
        )),
      ]),
    );

    if (isMobile) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [content, const SizedBox(height: 32), visual]);
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: reversed
          ? [Expanded(child: visual), const SizedBox(width: 60), Expanded(child: content)]
          : [Expanded(child: content), const SizedBox(width: 60), Expanded(child: visual)],
    );
  }
}
