import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../shared/widgets/gradient_button.dart';
import '../../../../shared/widgets/gradient_text.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = ResponsiveHelper.isMobile(context);
    final hPad = ResponsiveHelper.horizontalPadding(context);
    final vPad = ResponsiveHelper.sectionPaddingV(context);

    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 680),
      decoration: BoxDecoration(
        gradient: isDark
            ? AppColors.heroGradient
            : const LinearGradient(
                begin: Alignment.topCenter, end: Alignment.bottomCenter,
                colors: [Color(0xFFEEEEFF), Color(0xFFF8F9FF)]),
      ),
      child: Stack(
        children: [
          if (isDark) ...[
            Positioned(
              top: -80, right: -80,
              child: Container(
                width: 500, height: 500,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(colors: [AppColors.primary.withOpacity(0.18), Colors.transparent]),
                ),
              ),
            ),
            Positioned(
              bottom: -60, left: -60,
              child: Container(
                width: 400, height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(colors: [AppColors.secondary.withOpacity(0.12), Colors.transparent]),
                ),
              ),
            ),
          ],
          Padding(
            padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
            child: isMobile ? _MobileHero() : _DesktopHero(),
          ),
        ],
      ),
    );
  }
}

class _DesktopHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(child: _HeroContent()),
        const SizedBox(width: 80),
        Expanded(child: _HeroVisual()),
      ],
    );
  }
}

class _MobileHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _HeroContent(isMobile: true),
        const SizedBox(height: 48),
        _HeroVisual(),
      ],
    );
  }
}

class _HeroContent extends StatelessWidget {
  final bool isMobile;
  const _HeroContent({this.isMobile = false});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final align = isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start;
    final tAlign = isMobile ? TextAlign.center : TextAlign.left;
    final wAlign = isMobile ? WrapAlignment.center : WrapAlignment.start;

    return Column(
      crossAxisAlignment: align,
      children: [
        Text(
          'Smart Software',
          style: AppTextStyles.displayMedium(context).copyWith(color: isDark ? AppColors.darkText : AppColors.lightText),
          textAlign: tAlign,
        ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.2, curve: Curves.easeOut),
        SizedBox(
          height: ResponsiveHelper.responsive<double>(context, mobile: 70, tablet: 90, desktop: 120),
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'AI Agent Integration',
                textStyle: AppTextStyles.displayMedium(context).copyWith(
                  foreground: Paint()..shader = const LinearGradient(
                    colors: [Color(0xFFFF6584), Color(0xFFF59E0B)],
                  ).createShader(const Rect.fromLTWH(0, 0, 600, 200)),
                ),
                speed: const Duration(milliseconds: 70),
                textAlign: tAlign,
              ),
              TypewriterAnimatedText(
                'AI Data Engineering',
                textStyle: AppTextStyles.displayMedium(context).copyWith(
                  foreground: Paint()..shader = const LinearGradient(
                    colors: [Color(0xFF10B981), Color(0xFF00D4FF)],
                  ).createShader(const Rect.fromLTWH(0, 0, 600, 200)),
                ),
                speed: const Duration(milliseconds: 70),
                textAlign: tAlign,
              ),
              TypewriterAnimatedText(
                'Co-Operative Management',
                textStyle: AppTextStyles.displayMedium(context).copyWith(
                  foreground: Paint()..shader = const LinearGradient(
                    colors: [Color(0xFF6C63FF), Color(0xFF00D4FF)],
                  ).createShader(const Rect.fromLTWH(0, 0, 600, 200)),
                ),
                speed: const Duration(milliseconds: 70),
                textAlign: tAlign,
              ),
              TypewriterAnimatedText(
                'School Management',
                textStyle: AppTextStyles.displayMedium(context).copyWith(
                  foreground: Paint()..shader = const LinearGradient(
                    colors: [Color(0xFF6C63FF), Color(0xFFFF6584)],
                  ).createShader(const Rect.fromLTWH(0, 0, 600, 200)),
                ),
                speed: const Duration(milliseconds: 70),
                textAlign: tAlign,
              ),
              TypewriterAnimatedText(
                'Madrassa Management',
                textStyle: AppTextStyles.displayMedium(context).copyWith(
                  foreground: Paint()..shader = const LinearGradient(
                    colors: [Color(0xFF00D4FF), Color(0xFF6C63FF)],
                  ).createShader(const Rect.fromLTWH(0, 0, 600, 200)),
                ),
                speed: const Duration(milliseconds: 70),
                textAlign: tAlign,
              ),
              
              TypewriterAnimatedText(
                'Doctors Prescription',
                textStyle: AppTextStyles.displayMedium(context).copyWith(
                  foreground: Paint()..shader = const LinearGradient(
                    colors: [Color(0xFFFF6584), Color(0xFFF59E0B)],
                  ).createShader(const Rect.fromLTWH(0, 0, 600, 200)),
                ),
                speed: const Duration(milliseconds: 70),
                textAlign: tAlign,
              ),              
            ],
            repeatForever: true,
            pause: const Duration(milliseconds: 1200),
            isRepeatingAnimation: true,
          ),
        ).animate().fadeIn(delay: 400.ms),
        const SizedBox(height: 24),
        Text(
          'We build premium software solutions for Web, Android, iOS, and AI platforms that transform businesses and communities.',
          style: AppTextStyles.bodyXL(context).copyWith(
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary),
          textAlign: tAlign,
        ).animate().fadeIn(delay: 500.ms),
        const SizedBox(height: 40),
        Wrap(
          spacing: 16,
          runSpacing: 12,
          alignment: wAlign,
          children: [
            GradientButton(
              label: 'View Our Services',
              onPressed: () => context.go('/services'),
              icon: Icons.arrow_forward_rounded,
            ),
            GradientButton(
              label: 'Get in Touch',
              onPressed: () => context.go('/contact'),
              variant: GradientButtonVariant.secondary,
            ),
          ],
        ).animate().fadeIn(delay: 600.ms),
      ],
    );
  }
}

class _HeroVisual extends StatefulWidget {
  @override State<_HeroVisual> createState() => _HeroVisualState();
}

class _HeroVisualState extends State<_HeroVisual> with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _float;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(seconds: 4))..repeat(reverse: true);
    _float = Tween<double>(begin: -10, end: 10).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() { _ctrl.dispose(); super.dispose(); }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _float,
      builder: (context, child) => Transform.translate(offset: Offset(0, _float.value), child: child),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          gradient: AppColors.cardGradient,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.darkBorder),
          boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.25), blurRadius: 60, offset: const Offset(0, 20))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              _dot(const Color(0xFFFF5F57)),
              const SizedBox(width: 6),
              _dot(const Color(0xFFFFBD2E)),
              const SizedBox(width: 6),
              _dot(const Color(0xFF28C840)),
            ]),
            const SizedBox(height: 24),
            _MiniCard(icon: '🎯', title: 'Smart Attendance', sub: '5,000+ employees tracked', color: AppColors.primary, delay: 700),
            const SizedBox(height: 12),
            _MiniCard(icon: '🎓', title: 'School Management', sub: '15 institutions online', color: AppColors.secondary, delay: 800),
            const SizedBox(height: 12),
            _MiniCard(icon: '💊', title: 'Doctor Prescription', sub: '200+ doctors active daily', color: AppColors.accent, delay: 900),
            const SizedBox(height: 20),
            Row(children: [
              _Stat(value: '50+', label: 'Clients'),
              const SizedBox(width: 10),
              _Stat(value: '120+', label: 'Projects'),
              const SizedBox(width: 10),
              _Stat(value: '5yr', label: 'Experience'),
            ]),
          ],
        ),
      ).animate().fadeIn(delay: 700.ms).scale(begin: const Offset(0.92, 0.92), curve: Curves.easeOut),
    );
  }

  Widget _dot(Color c) => Container(width: 12, height: 12, decoration: BoxDecoration(color: c, shape: BoxShape.circle));
}

class _MiniCard extends StatelessWidget {
  final String icon, title, sub;
  final Color color;
  final int delay;
  const _MiniCard({required this.icon, required this.title, required this.sub, required this.color, required this.delay});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(children: [
        Text(icon, style: const TextStyle(fontSize: 22)),
        const SizedBox(width: 12),
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white)),
            Text(sub, style: GoogleFonts.inter(fontSize: 11, color: AppColors.darkTextSecondary)),
          ],
        )),
        Icon(Icons.trending_up_rounded, color: color, size: 18),
      ]),
    ).animate(delay: Duration(milliseconds: delay)).fadeIn().slideX(begin: 0.2, curve: Curves.easeOut);
  }
}

class _Stat extends StatelessWidget {
  final String value, label;
  const _Stat({required this.value, required this.label});
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.darkCard,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.darkBorder),
      ),
      child: Column(children: [
        GradientText(value, style: GoogleFonts.spaceGrotesk(fontSize: 17, fontWeight: FontWeight.w700)),
        Text(label, style: GoogleFonts.inter(fontSize: 11, color: AppColors.darkTextSecondary)),
      ]),
    ));
  }
}
