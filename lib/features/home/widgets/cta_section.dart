import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../shared/widgets/animations/fade_in_widget.dart';

class CTASection extends StatelessWidget {
  const CTASection({super.key});

  @override
  Widget build(BuildContext context) {
    final hPad = ResponsiveHelper.horizontalPadding(context);
    final isMobile = ResponsiveHelper.isMobile(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 40),
      child: FadeInWidget(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 28 : 80, vertical: isMobile ? 48 : 80),
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(0.35), blurRadius: 60, offset: const Offset(0, 20))],
          ),
          child: Column(
            children: [
              Text(
                'Ready to Transform Your Business?',
                style: AppTextStyles.displaySmall(context).copyWith(color: Colors.white, fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Join 50+ organizations that trust CodersThink to power their digital operations.',
                style: AppTextStyles.bodyLarge(context).copyWith(color: Colors.white.withOpacity(0.85)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 16, runSpacing: 12, alignment: WrapAlignment.center,
                children: [
                  _CTABtn(label: 'Start a Project', onTap: () => context.go('/contact'), primary: true),
                  _CTABtn(label: 'See Our Work', onTap: () => context.go('/portfolio'), primary: false),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CTABtn extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool primary;
  const _CTABtn({required this.label, required this.onTap, required this.primary});
  @override State<_CTABtn> createState() => _CTABtnState();
}

class _CTABtnState extends State<_CTABtn> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          transform: _hovered ? (Matrix4.identity()..translate(0.0, -2.0)) : Matrix4.identity(),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
          decoration: BoxDecoration(
            color: widget.primary ? Colors.white : Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(10),
            border: widget.primary ? null : Border.all(color: Colors.white.withOpacity(0.4)),
            boxShadow: widget.primary && _hovered
                ? [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 16, offset: const Offset(0, 6))]
                : [],
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.inter(
              fontSize: 14, fontWeight: FontWeight.w700,
              color: widget.primary ? AppColors.primary : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
