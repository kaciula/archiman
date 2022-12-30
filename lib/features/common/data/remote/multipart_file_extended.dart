import 'dart:async';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:path/path.dart' as path;
import 'package:universal_io/io.dart';

class MultipartFileExtended extends MultipartFile {
  MultipartFileExtended(
    Stream<List<int>> stream,
    int length, {
    String? filename,
    this.filePath,
    MediaType? contentType,
  }) : super(stream, length, filename: filename, contentType: contentType);

  final String? filePath;

  static MultipartFileExtended fromFileSync(
    String filePath, {
    String? filename,
    MediaType? contentType,
  }) =>
      multipartFileFromPathSync(
        filePath,
        filename: filename,
        contentType: contentType,
      );
}

MultipartFileExtended multipartFileFromPathSync(
  String filePath, {
  String? filename,
  MediaType? contentType,
}) {
  filename ??= path.basename(filePath);
  final File file = File(filePath);
  final int length = file.lengthSync();
  final Stream<List<int>> stream = file.openRead();
  return MultipartFileExtended(
    stream,
    length,
    filename: filename,
    contentType: contentType,
    filePath: filePath,
  );
}
