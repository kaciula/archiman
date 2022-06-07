import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

class LoggingInterceptor extends Interceptor {
  LoggingInterceptor({this.showCURL = false, required this.logPrint});

  final bool showCURL;
  void Function(Object object) logPrint;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final List<String> logs = [];
    logs.add('REQUEST: ${options.method} ${options.uri}');
    logs.add('HEADERS: ${json.encode(options.headers)}');
    if (options.data != null && options.data != '') {
      if (options.data is! FormData) {
        logs.add('DATA: ${json.encode(options.data)}');
      } else {
        final FormData formData = options.data;
        final List<MapEntry<String, String>> fields = formData.fields;
        final List<MapEntry<String, MultipartFile>> files = formData.files;
        logs.add('FORMDATA: ');
        for (MapEntry<String, String> entry in fields) {
          logs.add('${entry.key}: ${entry.value}');
        }
        for (MapEntry<String, MultipartFile> entry in files) {
          logs.add('${entry.key}: ${entry.value}');
        }
      }
    }
    _logWithFold(logs);

    if (showCURL) {
      _logger.fine(_cURLRepresentation(options));
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final List<String> logs = [];
    logs.add(
        'RESPONSE: ${response.requestOptions.method} ${response.requestOptions.uri} ${response.statusCode}');
    // log.add('HEADERS: ${json.encode(response.requestOptions.headers)}');
    if (response.data != null) {
      logs.add('DATA: ${json.encode(response.data)}');
    }
    _logWithFold(logs);

    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    final List<String> logs = [];
    logs.add(
        'ERROR: ${err.requestOptions.method} ${err.requestOptions.uri} ${err.response?.statusCode ?? ''}');
    if (err.response != null) {
      logs.add('HEADERS: ${json.encode(err.response!.headers.map)}');
    }
    if (err.response != null && err.response!.data != null) {
      logs.add('DATA: ${err.response!.data}');
    }
    _logWithFold(logs, isWarning: true);

    handler.next(err);
  }

  void _logWithFold(List<String> logs, {bool isWarning = false}) {
    final String msg = logs.fold(
      '',
      (String? previousValue, String it) {
        if (previousValue!.isEmpty) return it;
        return '$previousValue\n$it';
      },
    );
    if (isWarning) {
      _logger.warning(msg);
    } else {
      _logger.fine(msg);
    }
  }

  String _cURLRepresentation(RequestOptions options) {
    List<String> components = ['\$ curl -i'];
    if (options.method.toUpperCase() == 'GET') {
      components.add('-X ${options.method}');
    }

    options.headers.forEach((k, v) {
      if (k != 'Cookie') {
        components.add("-H \"$k: $v\"");
      }
    });

    if (options.data != null) {
      if (options.data is! FormData) {
        String data = json.encode(options.data);
        data = data.replaceAll('"', '\\"');
        components.add("-d \"$data\"");
      } else {
        final FormData formData = options.data;
        final List<MapEntry<String, String>> fields = formData.fields;
        // final List<MapEntry<String, MultipartFile>> files = formData.files;
        // LATER: how to pass file from form data to curl?

        if (fields.isNotEmpty) {
          String value = '';
          for (int i = 0; i < fields.length; i++) {
            final MapEntry<String, String> entry = fields[i];
            if (i != 0) {
              value += '&';
            }
            value += '${entry.key}=${entry.value}';
          }
          components.add('-d "$value"');
        }
      }
    }

    components.add("\"${options.uri.toString()}\"");

    return components.join(' \\\n');
  }
}

// ignore: unused_element
final Logger _logger = Logger('Network');
