import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';
import '../gradient_button.dart';

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key});

  static const _navItems = [
    {'label': 'Home', 'route': '/', 'icon': Icons.home_rounded},
    {'label': 'About', 'route': '/about', 'icon': Icons.info_rounded},
    {'label': 'Services', 'route': '/services', 'icon': Icons.design_services_rounded},
    {'label': 'Portfolio', 'route': '/portfolio', 'icon': Icons.work_rounded},
    {'label': 'Careers', 'route': '/careers', 'icon': Icons.people_rounded},
    {'label': 'Contact', 'route': '/contact', 'icon': Icons.mail_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    String currentRoute = '/';
    try { currentRoute = GoRouterState.of(context).uri.path; } catch (_) {}

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkSurface.withOpacity(0.97) : Colors.white.withOpacity(0.97),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            border: Border(top: BorderSide(color: isDark ? AppColors.darkBorder : AppColors.lightBorder)),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40, height: 4,
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ...(_navItems.map((item) {
                    final isActive = currentRoute == item['route'];
                    return ListTile(
                      leading: Icon(item['icon'] as IconData,
                          color: isActive ? AppColors.primary : (isDark ? AppColors.darkTextSecondary : AppColors.lightTextSecondary), size: 22),
                      title: Text(item['label'] as String,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                            color: isActive ? AppColors.primary : (isDark ? AppColors.darkText : AppColors.lightText),
                          )),
                      tileColor: isActive ? AppColors.primary.withOpacity(0.08) : Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      onTap: () { Navigator.pop(context); context.go(item['route'] as String); },
                    );
                  })).toList(),
                  const SizedBox(height: 12),
                  GradientButton(
                    label: 'Get In Touch',
                    width: double.infinity,
                    onPressed: () { Navigator.pop(context); context.go('/contact'); },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
