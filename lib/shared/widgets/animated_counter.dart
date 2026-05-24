import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class AnimatedCounter extends StatefulWidget {
  final int value;
  final String suffix;
  final String label;
  final Color? color;

  const AnimatedCounter({
    super.key,
    required this.value,
    this.suffix = '+',
    required this.label,
    this.color,
  });

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _started = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 2200));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _start() {
    if (!_started) {
      _started = true;
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final color = widget.color ?? AppColors.primary;

    return VisibilityDetector(
      key: Key('counter-${widget.label}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.3) _start();
      },
      child: Column(
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              final val = (_animation.value * widget.value).round();
              return ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) =>
                    LinearGradient(colors: [color, color.withOpacity(0.7)]).createShader(bounds),
                child: Text(
                  '$val${widget.suffix}',
                  style: AppTextStyles.displaySmall(context).copyWith(fontWeight: FontWeight.w800, color: Colors.white),
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          Text(
            widget.label,
            style: AppTextStyles.bodyMedium(context).copyWith(
              color: isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
