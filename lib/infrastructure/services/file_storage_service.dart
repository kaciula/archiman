import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';

class FileStorageService {
  late Directory tempDir;

  Future<void> init() async {
    tempDir = await getTemporaryDirectory();
  }

  Future<File> saveFileFromAssets(String assetName) async {
    final String fileName = assetName.split('/').last;
    final File file = _tempFile(fileName);
    // ignore: avoid_slow_async_io
    if (!await file.exists()) {
      final ByteData bytes = await rootBundle.load(assetName);
      return await file.writeAsBytes(bytes.buffer.asInt8List());
    } else {
      return file;
    }
  }

  File _tempFile(String fileName) {
    return File('${tempDir.path}/$fileName');
  }

  Future<File> saveFileFromBytes(Uint8List bytes,
      {required String fileName}) async {
    final File file = _tempFile(fileName);
    // ignore: avoid_slow_async_io
    if (!await file.exists()) {
      return await file.writeAsBytes(bytes);
    } else {
      return file;
    }
  }
}
