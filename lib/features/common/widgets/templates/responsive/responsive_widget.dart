import 'package:flutter/material.dart';

import 'responsive_breakpoints.dart';
import 'responsive_builder.dart';
import 'responsive_sizing_info.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    Key? key,
    this.phoneLikeSmallWidth,
    this.phoneLikeMediumWidth,
    this.phoneLikeLargeWidth,
    this.phoneLikeExtraLargeWidth,
    this.tabletLikeSmallWidth,
    this.tabletLikeMediumWidth,
    this.tabletLikeLargeWidth,
    this.tabletLikeExtraLargeWidth,
    this.desktopLikeSmallWidth,
    this.desktopLikeMediumWidth,
    this.desktopLikeLargeWidth,
    this.desktopLikeExtraLargeWidth,
  }) : super(key: key);

  final WidgetBuilder? phoneLikeSmallWidth;
  final WidgetBuilder? phoneLikeMediumWidth;
  final WidgetBuilder? phoneLikeLargeWidth;
  final WidgetBuilder? phoneLikeExtraLargeWidth;

  final WidgetBuilder? tabletLikeSmallWidth;
  final WidgetBuilder? tabletLikeMediumWidth;
  final WidgetBuilder? tabletLikeLargeWidth;
  final WidgetBuilder? tabletLikeExtraLargeWidth;

  final WidgetBuilder? desktopLikeSmallWidth;
  final WidgetBuilder? desktopLikeMediumWidth;
  final WidgetBuilder? desktopLikeLargeWidth;
  final WidgetBuilder? desktopLikeExtraLargeWidth;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (BuildContext context, ResponsiveSizingInfo sizingInfo,
          ResponsiveBreakpoints breakpoints) {
        final double screenWidth = sizingInfo.screenSize.width;

        // --- Desktop like ---
        if (screenWidth >= breakpoints.desktopLikeExtraLarge &&
            desktopLikeExtraLargeWidth != null) {
          return desktopLikeExtraLargeWidth!(context);
        }
        if (screenWidth >= breakpoints.desktopLikeLarge &&
            desktopLikeLargeWidth != null) {
          return desktopLikeLargeWidth!(context);
        }
        if (screenWidth >= breakpoints.desktopLikeMedium &&
            desktopLikeMediumWidth != null) {
          return desktopLikeMediumWidth!(context);
        }
        if (screenWidth >= breakpoints.desktopLikeSmall &&
            desktopLikeSmallWidth != null) {
          return desktopLikeSmallWidth!(context);
        }

        // --- Tablet like ---
        if (screenWidth >= breakpoints.tabletLikeExtraLarge &&
            tabletLikeExtraLargeWidth != null) {
          return tabletLikeExtraLargeWidth!(context);
        }
        if (screenWidth >= breakpoints.tabletLikeLarge &&
            tabletLikeLargeWidth != null) {
          return tabletLikeLargeWidth!(context);
        }
        if (screenWidth >= breakpoints.tabletLikeMedium &&
            tabletLikeMediumWidth != null) {
          return tabletLikeMediumWidth!(context);
        }
        if (screenWidth >= breakpoints.tabletLikeSmall &&
            tabletLikeSmallWidth != null) {
          return tabletLikeSmallWidth!(context);
        }

        // --- Phone like ---
        if (screenWidth >= breakpoints.phoneLikeExtraLarge &&
            phoneLikeExtraLargeWidth != null) {
          return phoneLikeExtraLargeWidth!(context);
        }
        if (screenWidth >= breakpoints.phoneLikeLarge &&
            phoneLikeLargeWidth != null) {
          return phoneLikeLargeWidth!(context);
        }
        if (screenWidth >= breakpoints.phoneLikeMedium &&
            phoneLikeMediumWidth != null) {
          return phoneLikeMediumWidth!(context);
        }

        return phoneLikeSmallWidth!(context);
      },
    );
  }
}
