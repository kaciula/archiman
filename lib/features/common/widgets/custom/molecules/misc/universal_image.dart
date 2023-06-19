import 'package:archiman/app/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../generic/molecules/misc/generic_universal_image.dart';

class UniversalImage extends StatelessWidget {
  const UniversalImage(
    this.uri, {
    Key? key,
    this.color,
    this.colorBlendMode,
    this.width,
    this.height,
    this.cacheWidth,
    this.cacheHeight,
    this.fit,
    this.isCircle = false,
    this.useCaching = true,
  }) : super(key: key);

  final String? uri;
  final Color? color;
  final BlendMode? colorBlendMode;
  final double? width;
  final double? height;
  final int? cacheWidth;
  final int? cacheHeight;
  final BoxFit? fit;
  final bool isCircle;
  final bool useCaching;

  @override
  Widget build(BuildContext context) {
    return GenericUniversalImage(
      uri,
      color: color,
      colorBlendMode: colorBlendMode,
      width: width,
      height: height,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
      fit: fit,
      isCircle: isCircle,
      useCaching: useCaching,
      errorColor: AppColors.red,
      errorPlaceholder: null,
    );
  }
}
