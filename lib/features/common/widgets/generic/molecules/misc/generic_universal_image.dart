import 'package:archiman/features/common/utils/generic/string_extension.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg_provider;
import 'package:universal_io/io.dart';

class GenericUniversalImage extends StatelessWidget {
  const GenericUniversalImage(
    this.uri, {
    Key? key,
    required this.color,
    required this.colorBlendMode,
    required this.width,
    required this.height,
    required this.cacheWidth,
    required this.cacheHeight,
    required this.fit,
    required this.isCircle,
    required this.useCaching,
    required this.errorColor,
    required this.errorPlaceholder,
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
  final Color errorColor;
  final Widget? errorPlaceholder;

  @override
  Widget build(BuildContext context) {
    if (uri.isBlank) {
      return _errorPlaceholder();
    }

    if (!isCircle) {
      if (uri!.startsWith('assets')) {
        if (uri!.endsWith('.svg')) {
          return SvgPicture.asset(
            uri!,
            color: color,
            colorBlendMode: colorBlendMode ?? BlendMode.srcIn,
            width: width,
            height: height,
            fit: fit ?? BoxFit.contain,
          );
        } else {
          return Image.asset(
            uri!,
            color: color,
            colorBlendMode: colorBlendMode,
            width: width,
            height: height,
            fit: fit,
            errorBuilder: (context, error, stackTrace) => _errorPlaceholder(),
          );
        }
      } else if (uri!.startsWith('/')) {
        return Image.file(
          File(uri!),
          color: color,
          colorBlendMode: colorBlendMode,
          width: width,
          height: height,
          fit: fit,
          errorBuilder: (context, error, stackTrace) => _errorPlaceholder(),
        );
      } else {
        return ExtendedImage.network(
          uri!,
          cache: useCaching,
          color: color,
          colorBlendMode: colorBlendMode,
          width: width,
          height: height,
          cacheWidth: cacheWidth,
          cacheHeight: cacheHeight,
          fit: fit,
          loadStateChanged: (ExtendedImageState state) {
            switch (state.extendedImageLoadState) {
              case LoadState.loading:
                break;
              case LoadState.completed:
                break;
              case LoadState.failed:
                return _errorPlaceholder();
            }
            return null;
          },
        );
      }
    } else {
      late final ImageProvider imageProvider;
      if (uri!.startsWith('assets')) {
        if (uri!.endsWith('.svg')) {
          imageProvider = svg_provider.Svg(uri!);
        } else {
          imageProvider = AssetImage(uri!);
        }
      } else if (uri!.startsWith('/')) {
        imageProvider = FileImage(File(uri!));
      } else {
        imageProvider = ExtendedNetworkImageProvider(uri!);
      }

      final double radius =
          width != null ? width! / 2 : (height != null ? height! / 2 : 16);
      return CircleAvatar(
        backgroundImage: imageProvider,
        backgroundColor: Colors.transparent,
        onBackgroundImageError: (Object exception, StackTrace? stackTrace) {
          // Do nothing here and catch error
        },
        radius: radius,
      );
    }
  }

  Widget _errorPlaceholder() {
    if (errorPlaceholder != null) {
      return errorPlaceholder!;
    } else {
      if (!isCircle) {
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: errorColor.withOpacity(0.2),
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
          backgroundColor: errorColor,
        );
      }
    }
  }
}
