import 'package:archiman/app/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;
import 'package:optimized_cached_image/optimized_cached_image.dart';
import 'package:universal_io/io.dart';

class UniversalImage extends StatelessWidget {
  const UniversalImage(
    this.uri, {
    Key? key,
    this.color,
    this.width,
    this.height,
    this.fit,
    this.isCircle = false,
  }) : super(key: key);

  final String uri;
  final Color? color;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    if (uri.isEmpty) {
      return _error();
    }

    if (!isCircle) {
      if (uri.startsWith('assets')) {
        if (uri.endsWith('.svg')) {
          return SvgPicture.asset(
            uri,
            color: color,
            width: width,
            height: height,
            fit: fit ?? BoxFit.contain,
          );
        } else {
          return Image.asset(
            uri,
            color: color,
            width: width,
            height: height,
            fit: fit,
          );
        }
      } else if (uri.startsWith('/')) {
        return Image.file(
          File(uri),
          color: color,
          width: width,
          height: height,
          fit: fit,
        );
      } else {
        return OptimizedCacheImage(
          imageUrl: uri,
          color: color,
          width: width,
          height: height,
          fit: fit,
          errorWidget: (context, url, error) => _error(),
        );
      }
    } else {
      late final ImageProvider imageProvider;
      if (uri.startsWith('assets')) {
        if (uri.endsWith('.svg')) {
          imageProvider = svg_provider.Svg(uri);
        } else {
          imageProvider = AssetImage(uri);
        }
      } else if (uri.startsWith('/')) {
        imageProvider = FileImage(File(uri));
      } else {
        imageProvider = OptimizedCacheImageProvider(uri);
      }

      final double radius =
          width != null ? width! / 2 : (height != null ? height! / 2 : 16);
      return CircleAvatar(
        backgroundImage: imageProvider,
        backgroundColor: AppColors.transparent,
        onBackgroundImageError: (Object exception, StackTrace? stackTrace) {
          // Do nothing here and catch error
        },
        radius: radius,
      );
    }
  }

  Widget _error() {
    if (!isCircle) {
      return Container(
        padding: EdgeInsets.all(AppInsets.i16),
        decoration: BoxDecoration(
          color: AppColors.red.withOpacity(0.2),
          shape: BoxShape.rectangle,
        ),
        height: height,
        width: width,
        child: Icon(Icons.error, size: 24),
      );
    } else {
      final double radius =
          width != null ? width! / 2 : (height != null ? height! / 2 : 16);
      return CircleAvatar(
        radius: radius,
        backgroundColor: AppColors.red,
      );
    }
  }
}
