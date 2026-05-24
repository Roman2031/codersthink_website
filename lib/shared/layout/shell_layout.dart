import 'package:flutter/material.dart';
import '../widgets/nav/app_navbar.dart';
import '../widgets/footer/app_footer.dart';

class ShellLayout extends StatelessWidget {
  final Widget child;
  const ShellLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 80)),
              SliverToBoxAdapter(child: child),
              const SliverToBoxAdapter(child: AppFooter()),
            ],
          ),
          const AppNavbar(),
        ],
      ),
    );
  }
}
