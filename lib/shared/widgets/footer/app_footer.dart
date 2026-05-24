import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/responsive_helper.dart';
import '../gradient_text.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = ResponsiveHelper.isMobile(context);
    final hPad = ResponsiveHelper.horizontalPadding(context);

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        border: Border(top: BorderSide(color: isDark ? AppColors.darkBorder : AppColors.lightBorder)),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 60),
            child: isMobile ? _MobileFooterBody() : _DesktopFooterBody(),
          ),
          _BottomBar(isDark: isDark, hPad: hPad),
        ],
      ),
    );
  }
}

class _DesktopFooterBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: _BrandColumn()),
        const SizedBox(width: 60),
        Expanded(child: _LinkColumn(title: 'Company', items: const [
          {'label': 'About', 'route': '/about'},
          {'label': 'Services', 'route': '/services'},
          {'label': 'Portfolio', 'route': '/portfolio'},
          {'label': 'Careers', 'route': '/careers'},
        ])),
        Expanded(child: _LinkColumn(title: 'Services', items: const [
          {'label': 'Smart Attendance', 'route': '/services'},
          {'label': 'Co-Operative Mgmt', 'route': '/services'},
          {'label': 'School Management', 'route': '/services'},
          {'label': 'Madrasa Management', 'route': '/services'},
          {'label': 'Doctor Prescription', 'route': '/services'},
        ])),
        Expanded(child: _ContactColumn()),
      ],
    );
  }
}

class _MobileFooterBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _BrandColumn(),
        const SizedBox(height: 40),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _LinkColumn(title: 'Company', items: const [
              {'label': 'About', 'route': '/about'},
              {'label': 'Services', 'route': '/services'},
              {'label': 'Portfolio', 'route': '/portfolio'},
              {'label': 'Careers', 'route': '/careers'},
            ])),
            Expanded(child: _ContactColumn()),
          ],
        ),
      ],
    );
  }
}

class _BrandColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/images/company_logo.png',
            height: 64,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          AppConstants.companySubtitle,
          style: GoogleFonts.inter(fontSize: 13, height: 1.7, color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
          maxLines: 4,
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            _SocialBtn(icon: Icons.link, url: AppConstants.linkedIn),
            const SizedBox(width: 10),
            _SocialBtn(icon: Icons.facebook, url: AppConstants.facebook),
          ],
        ),
      ],
    );
  }
}

class _LinkColumn extends StatelessWidget {
  final String title;
  final List<Map<String, String>> items;
  const _LinkColumn({required this.title, required this.items});
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w700,
            color: isDark ? AppColors.darkText : AppColors.lightText, letterSpacing: 0.5)),
        const SizedBox(height: 16),
        ...items.map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: _FooterLink(label: item['label']!, route: item['route']!),
        )),
      ],
    );
  }
}

class _ContactColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Contact', style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w700,
            color: isDark ? AppColors.darkText : AppColors.lightText, letterSpacing: 0.5)),
        const SizedBox(height: 16),
        _InfoItem(icon: Icons.email_outlined, text: AppConstants.companyEmail, onTap: () => launchUrl(Uri.parse('mailto:${AppConstants.companyEmail}'))),
        const SizedBox(height: 10),
        _InfoItem(icon: Icons.phone_outlined, text: 'BD: ${AppConstants.companyPhoneBD}', onTap: () => launchUrl(Uri.parse('tel:${AppConstants.companyPhoneBD}'))),
        const SizedBox(height: 10),
        _InfoItem(icon: Icons.phone_outlined, text: 'CA: ${AppConstants.companyPhoneCA}', onTap: () => launchUrl(Uri.parse('tel:${AppConstants.companyPhoneCA}'))),
        const SizedBox(height: 10),
        _InfoItem(icon: Icons.message_outlined, text: 'WA (BD): ${AppConstants.companyWhatsAppBD}', onTap: () => launchUrl(Uri.parse('https://wa.me/8801672593932'))),
        const SizedBox(height: 10),
        _InfoItem(icon: Icons.message_outlined, text: 'WA (CA): ${AppConstants.companyWhatsAppCA}', onTap: () => launchUrl(Uri.parse('https://wa.me/16137978696'))),
        const SizedBox(height: 10),
        _InfoItem(icon: Icons.location_on_outlined, text: AppConstants.companyAddress),
      ],
    );
  }
}

class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  const _InfoItem({required this.icon, required this.text, this.onTap});
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    Widget content = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 14, color: AppColors.primary),
        const SizedBox(width: 8),
        Expanded(child: Text(text, style: GoogleFonts.inter(fontSize: 13, height: 1.5,
            color: isDark ? (onTap != null ? AppColors.darkText : AppColors.darkTextSecondary) : (onTap != null ? AppColors.lightText : AppColors.lightTextSecondary)))),
      ],
    );

    if (onTap != null) {
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: content,
        ),
      );
    }
    return content;
  }
}

class _FooterLink extends StatefulWidget {
  final String label, route;
  const _FooterLink({required this.label, required this.route});
  @override State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => context.go(widget.route),
        child: Text(widget.label, style: GoogleFonts.inter(fontSize: 13,
            color: _hovered ? AppColors.primary : (isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary))),
      ),
    );
  }
}

class _SocialBtn extends StatefulWidget {
  final IconData icon;
  final String url;
  const _SocialBtn({required this.icon, required this.url});
  @override State<_SocialBtn> createState() => _SocialBtnState();
}

class _SocialBtnState extends State<_SocialBtn> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(widget.url)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: 36, height: 36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: _hovered ? AppColors.primaryGradient : null,
            color: _hovered ? null : Colors.transparent,
            border: Border.all(color: _hovered ? Colors.transparent : AppColors.darkBorder),
          ),
          child: Icon(widget.icon, size: 16, color: _hovered ? Colors.white : AppColors.darkTextSecondary),
        ),
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  final bool isDark;
  final double hPad;
  const _BottomBar({required this.isDark, required this.hPad});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: isDark ? AppColors.darkBorder : AppColors.lightBorder)),
      ),
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 20),
      child: Row(
        children: [
          Text(
            '© ${DateTime.now().year} CodersThink Software Ltd. All rights reserved.',
            style: GoogleFonts.inter(fontSize: 12, color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted),
          ),
          const Spacer(),
          Text(
            'Built with Flutter ❤️',
            style: GoogleFonts.inter(fontSize: 12, color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted),
          ),
        ],
      ),
    );
  }
}
