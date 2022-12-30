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
    image = img.copyCrop(image!, cropRect.left.toInt(), cropRect.top.toInt(),
        cropRect.width.toInt(), cropRect.height.toInt());
    switch (imageType) {
      case ImageType.png:
        return img.encodePng(image) as Uint8List;
      case ImageType.jpg:
        return img.encodeJpg(image) as Uint8List;
    }
  }
}

enum ImageType { png, jpg }

// ignore: unused_element
final Logger _logger = Logger('CropImageService');
