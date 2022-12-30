import 'package:dio/dio.dart';

String mapErrorDetails(DioError e) {
  String errorDetails = e.message;
  errorDetails += '\n\n' '${e.requestOptions.method} ${e.requestOptions.uri}';
  if (e.response != null && e.response?.data != null) {
    errorDetails += '\n\n${e.response!.data}';
  }
  if (e.error is Error) {
    errorDetails += '\n\n${(e.error as Error).stackTrace}';
  }
  if (e.stackTrace != null) {
    errorDetails += '\n\n${e.stackTrace}';
  }
  return errorDetails;
}

String mapGeneralErrorDetails(dynamic e, dynamic stackTrace) {
  String errorDetails = e.toString();
  errorDetails += '\n\n$stackTrace';
  return errorDetails;
}
