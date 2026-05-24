import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../shared/widgets/animations/fade_in_widget.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/gradient_button.dart';
import '../../../../shared/widgets/section_header.dart';

class ServicesPreviewSection extends StatelessWidget {
  const ServicesPreviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final hPad = ResponsiveHelper.horizontalPadding(context);
    final vPad = ResponsiveHelper.sectionPaddingV(context);
    final isMobile = ResponsiveHelper.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
      child: Column(
        children: [
          FadeInWidget(
            child: SectionHeader(
              label: 'What We Build',
              title: 'Our ',
              gradientTitle: 'Core Services',
              subtitle: 'From attendance systems to healthcare platforms — we engineer software that makes a difference.',
            ),
          ),
          const SizedBox(height: 60),
          LayoutBuilder(builder: (context, constraints) {
            final count = isMobile ? 1 : (constraints.maxWidth < 900 ? 2 : 3);
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: count,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: isMobile ? 1.8 : 1.15,
              ),
              itemCount: AppConstants.services.length,
              itemBuilder: (context, i) {
                return FadeInWidget(
                  delay: Duration(milliseconds: 100 * i),
                  child: _ServiceCard(service: AppConstants.services[i]),
                );
              },
            );
          }),
          const SizedBox(height: 48),
          GradientButton(
            label: 'Explore All Services',
            onPressed: () => context.go('/services'),
            icon: Icons.arrow_forward_rounded,
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final Map<String, dynamic> service;
  const _ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = Color(service['color'] as int);
    final features = (service['features'] as List).take(3).toList();

    return GlassCard(
      hoverable: true,
      onTap: () => context.go('/services'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(
              width: 48, height: 48,
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: color.withOpacity(0.3)),
              ),
              child: Center(child: Text(service['icon'] as String, style: const TextStyle(fontSize: 22))),
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_rounded, size: 18, color: color),
          ]),
          const SizedBox(height: 16),
          Text(
            service['title'] as String,
            style: AppTextStyles.headlineMedium(context).copyWith(
                color: isDark ? AppColors.darkText : AppColors.lightText),
            maxLines: 1, overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              service['subtitle'] as String,
              style: AppTextStyles.bodyMedium(context).copyWith(
                  color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
              maxLines: 2, overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 6, runSpacing: 6,
            children: features.map((f) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(4)),
              child: Text(f as String, style: GoogleFonts.inter(fontSize: 11, color: color, fontWeight: FontWeight.w500)),
            )).toList(),
          ),
        ],
      ),
    );
  }
}
