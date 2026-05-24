import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';

enum GradientButtonVariant { primary, secondary, outline, ghost }

class GradientButton extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final GradientButtonVariant variant;
  final IconData? icon;
  final bool loading;
  final double? width;

  const GradientButton({
    super.key,
    required this.label,
    this.onPressed,
    this.variant = GradientButtonVariant.primary,
    this.icon,
    this.loading = false,
    this.width,
  });

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.loading ? null : widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: widget.width,
          transform: _hovered ? (Matrix4.identity()..translate(0.0, -2.0)) : Matrix4.identity(),
          decoration: _buildDecoration(isDark),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.loading)
                const SizedBox(
                  width: 16, height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                )
              else ...[
                if (widget.icon != null) ...[
                  Icon(widget.icon, size: 18, color: _labelColor),
                  const SizedBox(width: 8),
                ],
                Text(
                  widget.label,
                  style: GoogleFonts.inter(
                    fontSize: 14, fontWeight: FontWeight.w600,
                    color: _labelColor, letterSpacing: 0.2,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Color get _labelColor {
    switch (widget.variant) {
      case GradientButtonVariant.primary: return Colors.white;
      case GradientButtonVariant.secondary: return Colors.white;
      case GradientButtonVariant.outline: return AppColors.primary;
      case GradientButtonVariant.ghost: return AppColors.primary;
    }
  }

  BoxDecoration _buildDecoration(bool isDark) {
    switch (widget.variant) {
      case GradientButtonVariant.primary:
        return BoxDecoration(
          gradient: _hovered
              ? const LinearGradient(colors: [Color(0xFF9B94FF), Color(0xFF66E3FF)], begin: Alignment.topLeft, end: Alignment.bottomRight)
              : AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: AppColors.primary.withOpacity(_hovered ? 0.45 : 0.3), blurRadius: _hovered ? 28 : 16, offset: const Offset(0, 6))],
        );
      case GradientButtonVariant.secondary:
        return BoxDecoration(
          color: isDark ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.06),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: isDark ? Colors.white.withOpacity(0.15) : Colors.black.withOpacity(0.1)),
        );
      case GradientButtonVariant.outline:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.primary, width: 1.5),
          color: _hovered ? AppColors.primary.withOpacity(0.08) : Colors.transparent,
        );
      case GradientButtonVariant.ghost:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _hovered ? AppColors.primary.withOpacity(0.08) : Colors.transparent,
        );
    }
  }
}
