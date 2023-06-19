import 'dart:typed_data';
import 'dart:ui';

import 'package:archiman/features/common/utils/generic/file_extensions.dart';
import 'package:flutter/widgets.dart';
import 'package:image/image.dart' as img;
import 'package:kt_dart/kt.dart';
import 'package:logging/logging.dart';
import 'package:universal_io/io.dart';

class EditImageService {
  Future<KtPair<Uint8List, File>> apply({
    required File file,
    required Uint8List bytes,
    required Rect? cropRect,
    required double? rotateAngle,
  }) async {
    assert(cropRect != null || rotateAngle != null);

    final img.Command pipeline = img.Command()..decodeImage(bytes);
    if (cropRect != null) {
      pipeline.copyCrop(
        x: cropRect.left.toInt(),
        y: cropRect.top.toInt(),
        width: cropRect.width.toInt(),
        height: cropRect.height.toInt(),
      );
    }
    if (rotateAngle != null) {
      pipeline.copyRotate(angle: rotateAngle);
    }
    final img.Command resultCmd = await pipeline.executeThread();
    final img.Image image = resultCmd.outputImage!;

    switch (file.fileExtension?.toLowerCase()) {
      case 'png':
        return KtPair(img.encodePng(image), file);
      case 'jpg':
      case 'jpeg':
        return KtPair(img.encodeJpg(image), file);
      case 'webp':
        final File updatedFile =
            await _rename(file, '${file.fileNameWithoutExtension}.png');
        return KtPair(img.encodePng(image), updatedFile);
      default:
        throw Exception(
            'Unexpected image extension for file: ${file.fileName}');
    }
  }

  Future<File> _rename(File file, String newFileName) {
    final String path = file.path;
    final int lastSeparator = path.lastIndexOf(Platform.pathSeparator);
    final String newPath = path.substring(0, lastSeparator + 1) + newFileName;
    return file.rename(newPath);
  }
}

// ignore: unused_element
final Logger _logger = Logger('EditImageService');
