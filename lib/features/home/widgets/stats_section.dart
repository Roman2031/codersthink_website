import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../../../../shared/widgets/animated_counter.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hPad = ResponsiveHelper.horizontalPadding(context);
    final isMobile = ResponsiveHelper.isMobile(context);

    return Container(
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        border: Border.symmetric(horizontal: BorderSide(color: isDark ? AppColors.darkBorder : AppColors.lightBorder)),
      ),
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 60),
      child: isMobile ? _MobileLayout() : _DesktopLayout(),
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _counters(),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final c = _counters();
    return Column(children: [
      Row(children: [Expanded(child: c[0]), Expanded(child: c[1])]),
      const SizedBox(height: 40),
      Row(children: [Expanded(child: c[2]), Expanded(child: c[3])]),
    ]);
  }
}

List<Widget> _counters() => const [
  AnimatedCounter(value: 50, suffix: '+', label: 'Happy Clients', color: AppColors.primary),
  AnimatedCounter(value: 120, suffix: '+', label: 'Projects Delivered', color: AppColors.secondary),
  AnimatedCounter(value: 5, suffix: '+', label: 'Years Experience', color: AppColors.accent),
  AnimatedCounter(value: 25, suffix: '+', label: 'Team Members', color: Color(0xFF10B981)),
];
