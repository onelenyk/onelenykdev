import "package:flutter/material.dart";

class ResponsiveUtil {
  static bool isMobile(final BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(final BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 600 && width < 1024;
  }

  static bool isDesktop(final BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  static bool isDesktopFull(final BuildContext context) {
    final desktopWidth = MediaQuery.of(context).size.width >= 1024;
    final desktopHeight = MediaQuery.of(context).size.height >= 720;
    return desktopWidth && desktopHeight;
  }

  static bool isBigEnough(final BuildContext context, final double value) =>
      MediaQuery.of(context).size.width >= value;

  // Additional utility functions can be added here
  // Example: Getting the screen orientation
  static bool isPortrait(final BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;

  static bool isLandscape(final BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  // Example: Getting the device pixel ratio
  static double devicePixelRatio(final BuildContext context) =>
      MediaQuery.of(context).devicePixelRatio;

// Add more functions as per your requirement
}
