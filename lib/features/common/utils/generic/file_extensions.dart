import 'package:universal_io/io.dart';

extension FileSystemEntityExt on FileSystemEntity {
  String get name {
    return path.split('/').last;
  }

  String get extension {
    return path.split('.').last;
  }
}
