import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Dark Theme ──────────────────────────────────────────
  static const darkBackground       = Color(0xFF0A0A0F);
  static const darkSurface          = Color(0xFF12121A);
  static const darkSurfaceElevated  = Color(0xFF1A1A28);
  static const darkSurfaceHighlight = Color(0xFF22223A);
  static const darkBorder           = Color(0x14FFFFFF); // 8% white
  static const darkBorderStrong     = Color(0x29FFFFFF); // 16% white

  // ── Light Theme ─────────────────────────────────────────
  static const lightBackground       = Color(0xFFFAFAFA);
  static const lightSurface          = Color(0xFFFFFFFF);
  static const lightSurfaceElevated  = Color(0xFFF3F4F6);
  static const lightSurfaceHighlight = Color(0xFFE5E7EB);
  static const lightBorder           = Color(0x14000000); // 8% black
  static const lightBorderStrong     = Color(0x29000000); // 16% black

  // ── Brand Colors ────────────────────────────────────────
  static const primary       = Color(0xFF6366F1); // Indigo 500
  static const primaryLight  = Color(0xFF818CF8); // Indigo 400
  static const primaryDark   = Color(0xFF4F46E5); // Indigo 600
  static const secondary     = Color(0xFF8B5CF6); // Violet 500
  static const accent        = Color(0xFF06B6D4); // Cyan 500
  static const accentWarm    = Color(0xFFF59E0B); // Amber 500
  static const success       = Color(0xFF10B981); // Emerald 500
  static const warning       = Color(0xFFF59E0B);
  static const error         = Color(0xFFEF4444);

  // ── Dark Text ───────────────────────────────────────────
  static const darkTextPrimary   = Color(0xFFF9FAFB);
  static const darkTextSecondary = Color(0xFFD1D5DB);
  static const darkTextMuted     = Color(0xFF6B7280);

  // ── Light Text ──────────────────────────────────────────
  static const lightTextPrimary   = Color(0xFF111827);
  static const lightTextSecondary = Color(0xFF374151);
  static const lightTextMuted     = Color(0xFF6B7280);

  // ── Glassmorphism ────────────────────────────────────────
  static const glassLight = Color(0x0FFFFFFF);  // 6% white
  static const glassDark  = Color(0x08000000);  // 3% black

  // ── Gradients ────────────────────────────────────────────
  static const gradientPrimary = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const gradientHero = LinearGradient(
    colors: [Color(0xFF6366F1), Color(0xFF8B5CF6), Color(0xFF06B6D4)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const gradientAccent = LinearGradient(
    colors: [secondary, accent],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const gradientCard = LinearGradient(
    colors: [Color(0xFF1A1A2E), Color(0xFF16213E)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // ── Glow Colors ──────────────────────────────────────────
  static const primaryGlow   = Color(0x406366F1);
  static const secondaryGlow = Color(0x408B5CF6);
  static const accentGlow    = Color(0x4006B6D4);
}
