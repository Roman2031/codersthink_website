import 'package:flutter/material.dart';
import 'widgets/hero_section.dart';
import 'widgets/stats_section.dart';
import 'widgets/services_preview.dart';
import 'widgets/cta_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        HeroSection(),
        StatsSection(),
        ServicesPreviewSection(),
        CTASection(),
      ],
    );
  }
}
