import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:image/image.dart' as img;
import 'package:logging/logging.dart';

class CropImageService {
  Future<Uint8List> crop({
    required Uint8List bytes,
    required Rect cropRect,
    required ImageType imageType,
  }) async {
    img.Image? image = img.decodeImage(bytes);
    image = img.copyCrop(image!,
        x: cropRect.left.toInt(),
        y: cropRect.top.toInt(),
        width: cropRect.width.toInt(),
        height: cropRect.height.toInt());
    switch (imageType) {
      case ImageType.png:
        return img.encodePng(image);
      case ImageType.jpg:
        return img.encodeJpg(image);
    }
  }
}

enum ImageType { png, jpg }

// ignore: unused_element
final Logger _logger = Logger('CropImageService');
