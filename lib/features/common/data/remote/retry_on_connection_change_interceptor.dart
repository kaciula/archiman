import 'package:dio/dio.dart';
import 'package:universal_io/io.dart';

import 'request_retrier.dart';

// Workaround for
class RetryOnConnectionChangeInterceptor extends Interceptor {
  RetryOnConnectionChangeInterceptor({required this.dio});

  final Dio dio;

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (_shouldRetryOnHttpException(err)) {
      try {
        final Response response =
            await RequestRetrier(dio: dio).requestRetry(err.requestOptions);
        handler.resolve(response);
        return;
      } catch (e) {
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
  }

  bool _shouldRetryOnHttpException(DioError err) {
    return err.type == DioErrorType.other &&
        err.error is HttpException &&
        err.message
            .contains('Connection closed before full header was received');
  }
}
