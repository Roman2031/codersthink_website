import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../shared/widgets/gradient_button.dart';

class JobCard extends StatefulWidget {
  final Map<String, String> job;
  const JobCard({super.key, required this.job});
  @override State<JobCard> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: isDark
              ? (_hovered ? AppColors.darkCard : AppColors.darkSurface)
              : (_hovered ? Colors.white : AppColors.lightBg),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: _hovered ? AppColors.primary : (isDark ? AppColors.darkBorder : AppColors.lightBorder)),
          boxShadow: _hovered
              ? [BoxShadow(color: AppColors.primary.withOpacity(0.12), blurRadius: 28, offset: const Offset(0, 8))]
              : [],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 12,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(widget.job['title']!,
                          style: AppTextStyles.headlineMedium(context).copyWith(
                              color: isDark ? AppColors.darkText : AppColors.lightText)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.primary.withOpacity(0.2)),
                        ),
                        child: Text(widget.job['type']!,
                            style: GoogleFonts.inter(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(widget.job['description']!,
                      style: AppTextStyles.bodyMedium(context).copyWith(
                          color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary)),
                  const SizedBox(height: 12),
                  Row(children: [
                    Icon(Icons.location_on_outlined, size: 14, color: AppColors.darkTextMuted),
                    const SizedBox(width: 4),
                    Text(widget.job['location']!, style: GoogleFonts.inter(fontSize: 13,
                        color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted)),
                    const SizedBox(width: 16),
                    Icon(Icons.business_outlined, size: 14, color: AppColors.darkTextMuted),
                    const SizedBox(width: 4),
                    Text(widget.job['department']!, style: GoogleFonts.inter(fontSize: 13,
                        color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted)),
                  ]),
                ],
              ),
            ),
            const SizedBox(width: 20),
            GradientButton(label: 'Apply Now', onPressed: () => context.go('/contact'), icon: Icons.send_rounded),
          ],
        ),
      ),
    );
  }
}
