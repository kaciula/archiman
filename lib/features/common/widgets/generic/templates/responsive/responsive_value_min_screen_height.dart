import 'package:flutter/material.dart';

import 'responsive_height_breakpoints.dart';

T responsiveValueMinScreenHeight<T>(
  BuildContext context, {
  required T minHeight320,
  T? minHeight375,
  T? minHeight414,
  T? minHeight480,
  T? minHeight600,
  T? minHeight768,
  T? minHeight850,
  T? minHeight900,
  T? minHeight950,
  T? minHeight1920,
  T? minHeight3840,
  T? minHeight4096,
}) {
  final Size screenSize = MediaQuery.of(context).size;
  final double screenHeight = screenSize.height;
  final ResponsiveHeightBreakpoints breakpoints = ResponsiveHeightBreakpoints();

  // --- Desktop like ---
  if (screenHeight >= breakpoints.minHeight4096 && minHeight4096 != null) {
    return minHeight4096;
  }
  if (screenHeight >= breakpoints.minHeight3840 && minHeight3840 != null) {
    return minHeight3840;
  }
  if (screenHeight >= breakpoints.minHeight1920 && minHeight1920 != null) {
    return minHeight1920;
  }
  if (screenHeight >= breakpoints.minHeight950 && minHeight950 != null) {
    return minHeight950;
  }

  // --- Tablet like ---
  if (screenHeight >= breakpoints.minHeight900 && minHeight900 != null) {
    return minHeight900;
  }
  if (screenHeight >= breakpoints.minHeight850 && minHeight850 != null) {
    return minHeight850;
  }
  if (screenHeight >= breakpoints.minHeight768 && minHeight768 != null) {
    return minHeight768;
  }
  if (screenHeight >= breakpoints.minHeight600 && minHeight600 != null) {
    return minHeight600;
  }

  // --- Phone like ---
  if (screenHeight >= breakpoints.minHeight480 && minHeight480 != null) {
    return minHeight480;
  }
  if (screenHeight >= breakpoints.minHeight414 && minHeight414 != null) {
    return minHeight414;
  }
  if (screenHeight >= breakpoints.minHeight375 && minHeight375 != null) {
    return minHeight375;
  }

  return minHeight320;
}
