import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

import 'responsive_height_breakpoints.dart';
import 'responsive_sizing_info.dart';

class ResponsiveHeightBuilder extends StatelessWidget {
  const ResponsiveHeightBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final ResponsiveBuilderCallback builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final Size screenSize = MediaQuery.of(context).size;
        final Size localWidgetSize =
            Size(constraints.maxWidth, constraints.maxHeight);
        ResponsiveDeviceType deviceType;
        if (kIsWeb) {
          deviceType = ResponsiveDeviceType.web;
        } else if (Platform.isAndroid || Platform.isIOS) {
          deviceType = ResponsiveDeviceType.mobile;
        } else {
          deviceType = ResponsiveDeviceType.desktop;
        }

        return builder(
          context,
          ResponsiveSizingInfo(screenSize, localWidgetSize, deviceType),
          ResponsiveHeightBreakpoints(),
        );
      },
    );
  }
}

typedef ResponsiveBuilderCallback = Widget Function(
  BuildContext context,
  ResponsiveSizingInfo sizingInfo,
  ResponsiveHeightBreakpoints breakpoints,
);
