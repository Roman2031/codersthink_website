import 'package:flutter/material.dart';
import '../constants/breakpoints.dart';

class ResponsiveHelper {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < Breakpoints.mobile;

  static bool isTablet(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return w >= Breakpoints.mobile && w < Breakpoints.tablet;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= Breakpoints.tablet;

  static T responsive<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    required T desktop,
  }) {
    if (isMobile(context)) return mobile;
    if (isTablet(context)) return tablet ?? desktop;
    return desktop;
  }

  static double horizontalPadding(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    if (w < Breakpoints.mobile) return 20;
    if (w < Breakpoints.tablet) return 40;
    if (w < Breakpoints.desktop) return 80;
    return (w - Breakpoints.contentMaxWidth) / 2;
  }

  static double sectionPaddingV(BuildContext context) {
    return isMobile(context)
        ? Breakpoints.sectionPaddingVMobile
        : Breakpoints.sectionPaddingV;
  }
}
