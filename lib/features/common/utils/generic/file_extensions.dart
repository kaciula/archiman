import 'package:universal_io/io.dart';

extension FileExt on File {
  String get fileName => path.split('/').last;

  String get fileNameWithoutExtension {
    final List<String> splits = fileName.split('.');
    return splits.first;
  }

  String? get fileExtension {
    final List<String> splits = fileName.split('.');
    return splits.length > 1 ? splits.last : null;
  }
}
