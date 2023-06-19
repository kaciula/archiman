import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'uncaught_error_handler.dart';

class UncaughtErrorHandlerDebug extends UncaughtErrorHandler {
  @override
  Future<void> handleFlutterError(FlutterErrorDetails details) async {
    final String sException = details.exceptionAsString();
    final bool shouldKill = shouldKillApp(sException);
    _warning('BOOOOM! Flutter error! [${details.exception}]\n${details.stack}');
    if (shouldKill) {
      _kill();
    }
  }

  @override
  Future<void> handleZonedError(dynamic exception, dynamic stack) async {
    final String sException = exception.toString();
    final bool shouldKill = shouldKillApp(sException);
    _warning('BOOOOM! Zoned error! [$exception]\n$stack');
    if (shouldKill) {
      _kill();
    }
  }

  @override
  Future<void> reportUnexpectedError(
      Exception exception, StackTrace trace, String context,
      {bool? killApp}) async {
    _warning(
        'BOOOOM! Would have reported unexpected error if it was release mode [$exception]');
    _warning(trace.toString());
  }

  @override
  Future<void> log(String msg) async {
    _warning(msg);
  }

  void _warning(String msg) {
    developer.log(msg, level: Level.WARNING.value);
  }

  void _kill() {
    _warning('The app would be killed right now if in release mode');
  }
}

// ignore: unused_element
final Logger _logger = Logger('UncaughtErrorHandlerDebug');
