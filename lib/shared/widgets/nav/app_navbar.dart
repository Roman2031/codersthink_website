import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/theme_provider.dart';
import '../../../core/utils/responsive_helper.dart';
import '../../../core/constants/breakpoints.dart';
import '../gradient_button.dart';
import 'mobile_drawer.dart';

class AppNavbar extends StatelessWidget {
  const AppNavbar({super.key});

  static const _navItems = [
    {'label': 'Home', 'route': '/'},
    {'label': 'About', 'route': '/about'},
    {'label': 'Services', 'route': '/services'},
    {'label': 'Portfolio', 'route': '/portfolio'},
    {'label': 'Careers', 'route': '/careers'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isMobile = ResponsiveHelper.isMobile(context);
    final horizontalPad = ResponsiveHelper.horizontalPadding(context);
    String currentRoute = '/';
    try {
      currentRoute = GoRouterState.of(context).uri.path;
    } catch (_) {}

    return Positioned(
      top: 0, left: 0, right: 0,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            height: Breakpoints.navbarHeight,
            decoration: BoxDecoration(
              color: isDark ? Colors.black.withOpacity(0.6) : Colors.white.withOpacity(0.85),
              border: Border(bottom: BorderSide(color: isDark ? Colors.white.withOpacity(0.08) : Colors.black.withOpacity(0.06))),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPad),
              child: Row(
                children: [
                  _Logo(),
                  const Spacer(),
                  if (!isMobile) ...[
                    Row(
                      children: _navItems.map((item) => _NavItem(
                        label: item['label']!,
                        route: item['route']!,
                        isActive: currentRoute == item['route'],
                        isDark: isDark,
                      )).toList(),
                    ),
                    const SizedBox(width: 24),
                    GradientButton(label: 'Contact Us', onPressed: () => context.go('/contact')),
                    const SizedBox(width: 12),
                  ],
                  _ThemeToggle(),
                  if (isMobile) ...[
                    const SizedBox(width: 4),
                    _HamburgerButton(),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go('/'),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            'assets/images/company_logo.png',
            height: 52,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  final String label, route;
  final bool isActive, isDark;
  const _NavItem({required this.label, required this.route, required this.isActive, required this.isDark});
  @override State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _hovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => context.go(widget.route),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: widget.isActive ? AppColors.primary.withOpacity(0.12) : (_hovered ? AppColors.primary.withOpacity(0.06) : Colors.transparent),
          ),
          child: Text(
            widget.label,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: widget.isActive ? FontWeight.w600 : FontWeight.w500,
              color: widget.isActive ? AppColors.primary : (widget.isDark ? Colors.white : AppColors.lightText).withOpacity(0.85),
            ),
          ),
        ),
      ),
    );
  }
}

class _ThemeToggle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return IconButton(
      onPressed: themeProvider.toggleTheme,
      tooltip: themeProvider.isDark ? 'Light mode' : 'Dark mode',
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Icon(
          themeProvider.isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
          key: ValueKey(themeProvider.isDark),
          color: themeProvider.isDark ? Colors.amber : const Color(0xFF6C63FF),
          size: 22,
        ),
      ),
    );
  }
}

class _HamburgerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (_) => const MobileDrawer(),
        );
      },
      icon: Icon(Icons.menu_rounded, color: isDark ? Colors.white : AppColors.lightText),
    );
  }
}
