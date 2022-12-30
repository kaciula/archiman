import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';

class FileStorageService {
  late Directory cacheDir;
  late Directory appSupportDir;
  late Directory appDataDir;

  Future<void> init() async {
    cacheDir = await getTemporaryDirectory();
    appSupportDir = await getApplicationSupportDirectory();
    appDataDir = await getApplicationDocumentsDirectory();
  }

  File cacheFile(String fileName) {
    return File('${cacheDir.path}/$fileName');
  }

  File appSupportFile(String fileName) {
    return File('${appSupportDir.path}/$fileName');
  }

  File appDataFile(String fileName) {
    return File('${appDataDir.path}/$fileName');
  }

  Future<File> saveFileFromAssets(String assetName,
      {bool saveInCache = true}) async {
    final String fileName = assetName.split('/').last;
    final File file = saveInCache ? cacheFile(fileName) : appDataFile(fileName);
    // ignore: avoid_slow_async_io
    if (!await file.exists()) {
      final ByteData bytes = await rootBundle.load(assetName);
      return await file.writeAsBytes(bytes.buffer.asInt8List());
    } else {
      return file;
    }
  }

  Future<File> saveFileFromBytes(
    Uint8List bytes, {
    required String fileName,
    bool override = false,
    bool saveInCache = true,
  }) async {
    final File file = saveInCache ? cacheFile(fileName) : appDataFile(fileName);
    // ignore: avoid_slow_async_io
    if (!await file.exists() || override) {
      return await file.writeAsBytes(bytes, flush: true);
    } else {
      return file;
    }
  }

  Future<File> saveFileFromString(
    String s, {
    required String fileName,
    bool saveInCache = true,
  }) async {
    final File file = saveInCache ? cacheFile(fileName) : appDataFile(fileName);
    return await file.writeAsString(s);
  }

  void deleteFile(String path) {
    File(path).deleteSync();
  }

  void deleteDirectory(String path) {
    File(path).deleteSync(recursive: true);
  }
}
