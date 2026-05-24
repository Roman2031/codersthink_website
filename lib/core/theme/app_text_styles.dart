import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  static double _fs(BuildContext context,
      {required double mobile, required double tablet, required double desktop}) {
    final w = MediaQuery.of(context).size.width;
    if (w < 600) return mobile;
    if (w < 1024) return tablet;
    return desktop;
  }

  static TextStyle displayXL(BuildContext context) => GoogleFonts.spaceGrotesk(
        fontSize: _fs(context, mobile: 38, tablet: 56, desktop: 80),
        fontWeight: FontWeight.w800,
        letterSpacing: -2.5,
        height: 1.05,
      );

  static TextStyle displayLarge(BuildContext context) => GoogleFonts.spaceGrotesk(
        fontSize: _fs(context, mobile: 32, tablet: 48, desktop: 64),
        fontWeight: FontWeight.w800,
        letterSpacing: -2,
        height: 1.1,
      );

  static TextStyle displayMedium(BuildContext context) => GoogleFonts.spaceGrotesk(
        fontSize: _fs(context, mobile: 26, tablet: 38, desktop: 48),
        fontWeight: FontWeight.w700,
        letterSpacing: -1.5,
        height: 1.15,
      );

  static TextStyle displaySmall(BuildContext context) => GoogleFonts.spaceGrotesk(
        fontSize: _fs(context, mobile: 22, tablet: 30, desktop: 38),
        fontWeight: FontWeight.w700,
        letterSpacing: -1,
        height: 1.2,
      );

  static TextStyle headlineLarge(BuildContext context) => GoogleFonts.spaceGrotesk(
        fontSize: _fs(context, mobile: 20, tablet: 26, desktop: 32),
        fontWeight: FontWeight.w700,
        letterSpacing: -0.5,
        height: 1.3,
      );

  static TextStyle headlineMedium(BuildContext context) => GoogleFonts.spaceGrotesk(
        fontSize: _fs(context, mobile: 18, tablet: 22, desktop: 26),
        fontWeight: FontWeight.w600,
        letterSpacing: -0.3,
        height: 1.35,
      );

  static TextStyle bodyXL(BuildContext context) => GoogleFonts.inter(
        fontSize: _fs(context, mobile: 17, tablet: 18, desktop: 20),
        fontWeight: FontWeight.w400,
        height: 1.7,
      );

  static TextStyle bodyLarge(BuildContext context) => GoogleFonts.inter(
        fontSize: _fs(context, mobile: 15, tablet: 16, desktop: 18),
        fontWeight: FontWeight.w400,
        height: 1.7,
      );

  static TextStyle bodyMedium(BuildContext context) => GoogleFonts.inter(
        fontSize: _fs(context, mobile: 14, tablet: 14, desktop: 16),
        fontWeight: FontWeight.w400,
        height: 1.6,
      );

  static TextStyle labelLarge(BuildContext context) => GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5,
      );
}
