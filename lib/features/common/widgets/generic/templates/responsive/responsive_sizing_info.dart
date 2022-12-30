import 'dart:ui';

class ResponsiveSizingInfo {
  ResponsiveSizingInfo(this.screenSize, this.localWidgetSize, this.deviceType);

  final Size screenSize;
  final Size localWidgetSize;
  final ResponsiveDeviceType deviceType;

  @override
  String toString() {
    return 'ResponsiveSizingInfo(screenSize: $screenSize, localWidgetSize: $localWidgetSize, deviceType: $deviceType)';
  }
}

enum ResponsiveDeviceType { mobile, web, desktop }
