import 'package:flutter/material.dart';

import 'responsive_sizing_info.dart';
import 'responsive_width_breakpoints.dart';
import 'responsive_width_builder.dart';

class ResponsiveWidgetMinScreenWidth extends StatelessWidget {
  const ResponsiveWidgetMinScreenWidth({
    Key? key,
    this.minWidth320,
    this.minWidth345,
    this.minWidth375,
    this.minWidth414,
    this.minWidth480,
    this.minWidth600,
    this.minWidth768,
    this.minWidth850,
    this.minWidth900,
    this.minWidth950,
    this.minWidth1920,
    this.minWidth3840,
    this.minWidth4096,
  }) : super(key: key);

  final WidgetBuilder? minWidth320;
  final WidgetBuilder? minWidth345;
  final WidgetBuilder? minWidth375;
  final WidgetBuilder? minWidth414;
  final WidgetBuilder? minWidth480;

  final WidgetBuilder? minWidth600;
  final WidgetBuilder? minWidth768;
  final WidgetBuilder? minWidth850;
  final WidgetBuilder? minWidth900;

  final WidgetBuilder? minWidth950;
  final WidgetBuilder? minWidth1920;
  final WidgetBuilder? minWidth3840;
  final WidgetBuilder? minWidth4096;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidthBuilder(
      builder: (BuildContext context, ResponsiveSizingInfo sizingInfo,
          ResponsivWidthBreakpoints breakpoints) {
        final double screenWidth = sizingInfo.screenSize.width;

        // --- Desktop like ---
        if (screenWidth >= breakpoints.minWidth4096 && minWidth4096 != null) {
          return minWidth4096!(context);
        }
        if (screenWidth >= breakpoints.minWidth3840 && minWidth3840 != null) {
          return minWidth3840!(context);
        }
        if (screenWidth >= breakpoints.minWidth1920 && minWidth1920 != null) {
          return minWidth1920!(context);
        }
        if (screenWidth >= breakpoints.minWidth950 && minWidth950 != null) {
          return minWidth950!(context);
        }

        // --- Tablet like ---
        if (screenWidth >= breakpoints.minWidth900 && minWidth900 != null) {
          return minWidth900!(context);
        }
        if (screenWidth >= breakpoints.minWidth850 && minWidth850 != null) {
          return minWidth850!(context);
        }
        if (screenWidth >= breakpoints.minWidth768 && minWidth768 != null) {
          return minWidth768!(context);
        }
        if (screenWidth >= breakpoints.minWidth600 && minWidth600 != null) {
          return minWidth600!(context);
        }

        // --- Phone like ---
        if (screenWidth >= breakpoints.minWidth480 && minWidth480 != null) {
          return minWidth480!(context);
        }
        if (screenWidth >= breakpoints.minWidth414 && minWidth414 != null) {
          return minWidth414!(context);
        }
        if (screenWidth >= breakpoints.minWidth375 && minWidth375 != null) {
          return minWidth375!(context);
        }
        if (screenWidth >= breakpoints.minWidth345 && minWidth345 != null) {
          return minWidth345!(context);
        }

        return minWidth320!(context);
      },
    );
  }
}
