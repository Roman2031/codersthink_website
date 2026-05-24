import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/utils/responsive_helper.dart';
import '../../../shared/widgets/animations/fade_in_widget.dart';
import '../../../shared/widgets/glass_card.dart';
import '../../../shared/widgets/gradient_text.dart';
import '../../../shared/widgets/section_header.dart';
import 'widgets/contact_form.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

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
            GradientText('Get In Touch', style: AppTextStyles.displayLarge(context), textAlign: TextAlign.center),
            const SizedBox(height: 20),
            Text(
              'Have a project in mind? We\'d love to hear from you. Let\'s build something great together.',
              style: AppTextStyles.bodyXL(context).copyWith(
                  color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
              textAlign: TextAlign.center,
            ),
          ])),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
          child: isMobile
              ? Column(children: [
                  _ContactInfo(isDark: isDark),
                  const SizedBox(height: 40),
                  const ContactForm(),
                ])
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _ContactInfo(isDark: isDark)),
                    const SizedBox(width: 60),
                    const Expanded(flex: 2, child: ContactForm()),
                  ],
                ),
        ),
      ],
    );
  }
}

class _ContactInfo extends StatelessWidget {
  final bool isDark;
  const _ContactInfo({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          label: 'Contact Us', title: 'Let\'s Build\n', gradientTitle: 'Something Great',
          alignment: CrossAxisAlignment.start,
        ),
        const SizedBox(height: 32),
        _InfoCard(icon: Icons.email_rounded, title: 'Email Us', value: AppConstants.companyEmail, color: AppColors.primary, isDark: isDark,
          onTap: () => launchUrl(Uri.parse('mailto:${AppConstants.companyEmail}'))),
        const SizedBox(height: 16),
        _InfoCard(icon: Icons.phone_rounded, title: 'Call Us (BD)', value: AppConstants.companyPhoneBD, color: AppColors.secondary, isDark: isDark,
          onTap: () => launchUrl(Uri.parse('tel:${AppConstants.companyPhoneBD}'))),
        const SizedBox(height: 16),
        _InfoCard(icon: Icons.phone_rounded, title: 'Call Us (CA)', value: AppConstants.companyPhoneCA, color: AppColors.secondary, isDark: isDark,
          onTap: () => launchUrl(Uri.parse('tel:${AppConstants.companyPhoneCA}'))),
        const SizedBox(height: 16),
        _InfoCard(icon: Icons.message_rounded, title: 'WhatsApp (BD)', value: AppConstants.companyWhatsAppBD, color: const Color(0xFF25D366), isDark: isDark,
          onTap: () => launchUrl(Uri.parse('https://wa.me/8801672593932'))),
        const SizedBox(height: 16),
        _InfoCard(icon: Icons.message_rounded, title: 'WhatsApp (CA)', value: AppConstants.companyWhatsAppCA, color: const Color(0xFF25D366), isDark: isDark,
          onTap: () => launchUrl(Uri.parse('https://wa.me/16137978696'))),
        const SizedBox(height: 16),
        _InfoCard(icon: Icons.location_on_rounded, title: 'Visit Us', value: AppConstants.companyAddress, color: AppColors.accent, isDark: isDark),
        const SizedBox(height: 28),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.success.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.success.withOpacity(0.2)),
          ),
          child: Row(children: [
            const Icon(Icons.schedule_rounded, color: AppColors.success, size: 18),
            const SizedBox(width: 10),
            Text('Response within 24 hours', style: AppTextStyles.bodyMedium(context).copyWith(
                color: AppColors.success, fontWeight: FontWeight.w500)),
          ]),
        ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title, value;
  final Color color;
  final bool isDark;
  final VoidCallback? onTap;
  const _InfoCard({required this.icon, required this.title, required this.value, required this.color, required this.isDark, this.onTap});

  @override
  Widget build(BuildContext context) {
    Widget card = GlassCard(
      hoverable: onTap != null,
      padding: const EdgeInsets.all(20),
      child: Row(children: [
        Container(
          width: 48, height: 48,
          decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
          child: Icon(icon, color: color, size: 22),
        ),
        const SizedBox(width: 16),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title, style: AppTextStyles.bodyMedium(context).copyWith(
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
              fontSize: 12, fontWeight: FontWeight.w600, letterSpacing: 0.5)),
          const SizedBox(height: 4),
          Text(value, style: AppTextStyles.bodyMedium(context).copyWith(
              color: isDark ? AppColors.darkText : AppColors.lightText, fontWeight: FontWeight.w500)),
        ])),
      ]),
    );

    if (onTap != null) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: card,
        ),
      );
    }
    return card;
  }
}
