import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'uncaught_error_handler.dart';

class UncaughtErrorHandlerDebug extends UncaughtErrorHandler {
  @override
  Future<void> handleFlutterError(FlutterErrorDetails details) async {
    _logger.warning('BOOOOM! Flutter error! [${details.exception}]');
  }

  @override
  Future<void> handleZonedError(dynamic exception, dynamic stack) async {
    _logger.warning('BOOOOM! Zoned error! [$exception]');
  }

  @override
  Future<void> reportUnexpectedError(
      Exception exception, StackTrace trace, String context,
      {bool? killApp}) async {
    _logger.warning(
        'BOOOOM! Would have reported unexpected error if it was release mode [$exception]');
  }

  @override
  Future<void> log(String msg) async {
    _logger.warning(msg);
  }
}

// ignore: unused_element
final Logger _logger = Logger('UncaughtErrorHandlerDebug');
