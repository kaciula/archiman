import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;

class UniversalImageDecoration extends DecorationImage {
  UniversalImageDecoration(
    String url, {
    BoxFit? fit,
    ColorFilter? colorFilter,
  }) : super(
          image: url.startsWith('assets')
              ? (url.endsWith('.svg')
                  ? svg_provider.Svg(url)
                  : AssetImage(url) as ImageProvider)
              : NetworkImage(url),
          fit: fit,
          colorFilter: colorFilter,
        );
}
