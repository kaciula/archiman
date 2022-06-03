import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:universal_io/io.dart';

class DownloadService {
  Future<File> downloadFile(String uri) async {
    return await DefaultCacheManager().getSingleFile(uri);
  }
}
