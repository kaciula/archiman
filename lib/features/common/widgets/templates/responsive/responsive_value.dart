import 'package:flutter/material.dart';

import 'responsive_breakpoints.dart';

T responsiveValue<T>(
  BuildContext context, {
  required T phoneLikeSmallWidth,
  T? phoneLikeMediumWidth,
  T? phoneLikeLargeWidth,
  T? phoneLikeExtraLargeWidth,
  T? tabletLikeSmallWidth,
  T? tabletLikeMediumWidth,
  T? tabletLikeLargeWidth,
  T? tabletLikeExtraLargeWidth,
  T? desktopLikeSmallWidth,
  T? desktopLikeMediumWidth,
  T? desktopLikeLargeWidth,
  T? desktopLikeExtraLargeWidth,
}) {
  final Size screenSize = MediaQuery.of(context).size;
  final double screenWidth = screenSize.width;
  final ResponsiveBreakpoints breakpoints = ResponsiveBreakpoints();

  // --- Desktop like ---
  if (screenWidth >= breakpoints.desktopLikeExtraLarge &&
      desktopLikeExtraLargeWidth != null) {
    return desktopLikeExtraLargeWidth;
  }
  if (screenWidth >= breakpoints.desktopLikeLarge &&
      desktopLikeLargeWidth != null) {
    return desktopLikeLargeWidth;
  }
  if (screenWidth >= breakpoints.desktopLikeMedium &&
      desktopLikeMediumWidth != null) {
    return desktopLikeMediumWidth;
  }
  if (screenWidth >= breakpoints.desktopLikeSmall &&
      desktopLikeSmallWidth != null) {
    return desktopLikeSmallWidth;
  }

  // --- Tablet like ---
  if (screenWidth >= breakpoints.tabletLikeExtraLarge &&
      tabletLikeExtraLargeWidth != null) {
    return tabletLikeExtraLargeWidth;
  }
  if (screenWidth >= breakpoints.tabletLikeLarge &&
      tabletLikeLargeWidth != null) {
    return tabletLikeLargeWidth;
  }
  if (screenWidth >= breakpoints.tabletLikeMedium &&
      tabletLikeMediumWidth != null) {
    return tabletLikeMediumWidth;
  }
  if (screenWidth >= breakpoints.tabletLikeSmall &&
      tabletLikeSmallWidth != null) {
    return tabletLikeSmallWidth;
  }

  // --- Phone like ---
  if (screenWidth >= breakpoints.phoneLikeExtraLarge &&
      phoneLikeExtraLargeWidth != null) {
    return phoneLikeExtraLargeWidth;
  }
  if (screenWidth >= breakpoints.phoneLikeLarge &&
      phoneLikeLargeWidth != null) {
    return phoneLikeLargeWidth;
  }
  if (screenWidth >= breakpoints.phoneLikeMedium &&
      phoneLikeMediumWidth != null) {
    return phoneLikeMediumWidth;
  }

  return phoneLikeSmallWidth;
}
