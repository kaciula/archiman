import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';

class FileStorageService {
  late Directory cacheDir;
  late Directory appSupportDir;
  late Directory appDataDir;
  late Directory downloadsDir;

  Future<void> init() async {
    cacheDir = await getTemporaryDirectory();
    appSupportDir = await getApplicationSupportDirectory();
    appDataDir = await getApplicationDocumentsDirectory();
    await _initDownloadsDir();
  }

  Future<void> _initDownloadsDir() async {
    if (!Platform.isAndroid) {
      downloadsDir = appDataDir;
    } else {
      Directory? dir;
      dir = Directory('/storage/emulated/0/Download/');
      if (!(await dir.exists())) {
        dir = Directory('/storage/emulated/0/Downloads/');
        if (!(await dir.exists())) {
          dir = null;
        }
      }
      // LATER: Maybe use some external storage directory for Android
      downloadsDir = dir ?? appDataDir;
    }
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

  File downloadsFile(String fileName) {
    return File('${downloadsDir.path}/$fileName');
  }

  Future<File> saveFileFromAssets(
      String assetName, FileLocation location) async {
    final String fileName = assetName.split('/').last;
    final File file = _file(fileName, location);
    // ignore: avoid_slow_async_io
    if (!await file.exists()) {
      final ByteData bytes = await rootBundle.load(assetName);
      return await file.writeAsBytes(bytes.buffer.asInt8List());
    } else {
      return file;
    }
  }

  Future<String> loadStringFromAssets(String assetName) {
    return rootBundle.loadString(assetName);
  }

  Future<File> saveFileFromBytes(
    Uint8List bytes, {
    required String fileName,
    required FileLocation location,
    bool override = false,
  }) async {
    final File file = _file(fileName, location);
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
    required FileLocation location,
  }) async {
    final File file = _file(fileName, location);
    return await file.writeAsString(s);
  }

  File _file(String fileName, FileLocation location) {
    switch (location) {
      case FileLocation.cache:
        return cacheFile(fileName);
      case FileLocation.appSupport:
        return appSupportFile(fileName);
      case FileLocation.appData:
        return appDataFile(fileName);
      case FileLocation.downloads:
        return downloadsFile(fileName);
      case FileLocation.absolutePath:
        return File(fileName);
    }
  }

  void deleteFile(String path) {
    File(path).deleteSync();
  }

  void deleteDirectory(String path) {
    File(path).deleteSync(recursive: true);
  }
}

enum FileLocation { cache, appSupport, appData, downloads, absolutePath }

// ignore: unused_element
final Logger _logger = Logger('FileStorageService');
