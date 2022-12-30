import 'package:flutter/material.dart';

import 'responsive_height_breakpoints.dart';
import 'responsive_height_builder.dart';
import 'responsive_sizing_info.dart';

class ResponsiveWidgetMinScreenHeight extends StatelessWidget {
  const ResponsiveWidgetMinScreenHeight({
    Key? key,
    this.minHeight320,
    this.minHeight375,
    this.minHeight414,
    this.minHeight480,
    this.minHeight600,
    this.minHeight768,
    this.minHeight850,
    this.minHeight900,
    this.minHeight950,
    this.minHeight1920,
    this.minHeight3840,
    this.minHeight4096,
  }) : super(key: key);

  final WidgetBuilder? minHeight320;
  final WidgetBuilder? minHeight375;
  final WidgetBuilder? minHeight414;
  final WidgetBuilder? minHeight480;

  final WidgetBuilder? minHeight600;
  final WidgetBuilder? minHeight768;
  final WidgetBuilder? minHeight850;
  final WidgetBuilder? minHeight900;

  final WidgetBuilder? minHeight950;
  final WidgetBuilder? minHeight1920;
  final WidgetBuilder? minHeight3840;
  final WidgetBuilder? minHeight4096;

  @override
  Widget build(BuildContext context) {
    return ResponsiveHeightBuilder(
      builder: (BuildContext context, ResponsiveSizingInfo sizingInfo,
          ResponsiveHeightBreakpoints breakpoints) {
        final double screenHeight = sizingInfo.screenSize.height;

        // --- Desktop like ---
        if (screenHeight >= breakpoints.minHeight4096 &&
            minHeight4096 != null) {
          return minHeight4096!(context);
        }
        if (screenHeight >= breakpoints.minHeight3840 &&
            minHeight3840 != null) {
          return minHeight3840!(context);
        }
        if (screenHeight >= breakpoints.minHeight1920 &&
            minHeight1920 != null) {
          return minHeight1920!(context);
        }
        if (screenHeight >= breakpoints.minHeight950 && minHeight950 != null) {
          return minHeight950!(context);
        }

        // --- Tablet like ---
        if (screenHeight >= breakpoints.minHeight900 && minHeight900 != null) {
          return minHeight900!(context);
        }
        if (screenHeight >= breakpoints.minHeight850 && minHeight850 != null) {
          return minHeight850!(context);
        }
        if (screenHeight >= breakpoints.minHeight768 && minHeight768 != null) {
          return minHeight768!(context);
        }
        if (screenHeight >= breakpoints.minHeight600 && minHeight600 != null) {
          return minHeight600!(context);
        }

        // --- Phone like ---
        if (screenHeight >= breakpoints.minHeight480 && minHeight480 != null) {
          return minHeight480!(context);
        }
        if (screenHeight >= breakpoints.minHeight414 && minHeight414 != null) {
          return minHeight414!(context);
        }
        if (screenHeight >= breakpoints.minHeight375 && minHeight375 != null) {
          return minHeight375!(context);
        }

        return minHeight320!(context);
      },
    );
  }
}
