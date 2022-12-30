import 'package:flutter/material.dart';

import 'responsive_width_breakpoints.dart';

T responsiveValueMinScreenWidth<T>(
  BuildContext context, {
  required T minWidth320,
  T? minWidth345,
  T? minWidth375,
  T? minWidth414,
  T? minWidth480,
  T? minWidth600,
  T? minWidth768,
  T? minWidth850,
  T? minWidth900,
  T? minWidth950,
  T? minWidth1920,
  T? minWidth3840,
  T? minWidth4096,
}) {
  final Size screenSize = MediaQuery.of(context).size;
  final double screenWidth = screenSize.width;
  final ResponsivWidthBreakpoints breakpoints = ResponsivWidthBreakpoints();

  // --- Desktop like ---
  if (screenWidth >= breakpoints.minWidth4096 && minWidth4096 != null) {
    return minWidth4096;
  }
  if (screenWidth >= breakpoints.minWidth3840 && minWidth3840 != null) {
    return minWidth3840;
  }
  if (screenWidth >= breakpoints.minWidth1920 && minWidth1920 != null) {
    return minWidth1920;
  }
  if (screenWidth >= breakpoints.minWidth950 && minWidth950 != null) {
    return minWidth950;
  }

  // --- Tablet like ---
  if (screenWidth >= breakpoints.minWidth900 && minWidth900 != null) {
    return minWidth900;
  }
  if (screenWidth >= breakpoints.minWidth850 && minWidth850 != null) {
    return minWidth850;
  }
  if (screenWidth >= breakpoints.minWidth768 && minWidth768 != null) {
    return minWidth768;
  }
  if (screenWidth >= breakpoints.minWidth600 && minWidth600 != null) {
    return minWidth600;
  }

  // --- Phone like ---
  if (screenWidth >= breakpoints.minWidth480 && minWidth480 != null) {
    return minWidth480;
  }
  if (screenWidth >= breakpoints.minWidth414 && minWidth414 != null) {
    return minWidth414;
  }
  if (screenWidth >= breakpoints.minWidth375 && minWidth375 != null) {
    return minWidth375;
  }
  if (screenWidth >= breakpoints.minWidth345 && minWidth345 != null) {
    return minWidth345;
  }

  return minWidth320;
}
