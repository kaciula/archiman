import 'package:dio/dio.dart';

import 'multipart_file_extended.dart';

class RequestRetrier {
  RequestRetrier({
    required this.dio,
  });

  final Dio dio;

  Future<Response> requestRetry(RequestOptions requestOptions) async {
    if (requestOptions.data is FormData) {
      // https://github.com/flutterchina/dio/issues/482
      final FormData formData = FormData();
      formData.fields.addAll(requestOptions.data.fields);
      // ignore: always_specify_types
      for (MapEntry mapFile in requestOptions.data.files) {
        formData.files.add(
          // ignore: always_specify_types
          MapEntry(
              mapFile.key,
              MultipartFileExtended.fromFileSync(mapFile.value.filePath,
                  filename: mapFile.value.filename)),
        );
      }
      requestOptions.data = formData;
    }

    return dio.request(
      requestOptions.path,
      cancelToken: requestOptions.cancelToken,
      data: requestOptions.data,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
      queryParameters: requestOptions.queryParameters,
      options: Options(
        contentType: requestOptions.contentType,
        headers: requestOptions.headers,
        sendTimeout: requestOptions.sendTimeout,
        receiveTimeout: requestOptions.receiveTimeout,
        extra: requestOptions.extra,
        followRedirects: requestOptions.followRedirects,
        listFormat: requestOptions.listFormat,
        maxRedirects: requestOptions.maxRedirects,
        method: requestOptions.method,
        receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
        requestEncoder: requestOptions.requestEncoder,
        responseDecoder: requestOptions.responseDecoder,
        responseType: requestOptions.responseType,
        validateStatus: requestOptions.validateStatus,
      ),
    );
  }
}
