import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

import 'uncaught_error_handler.dart';

class UncaughtErrorHandlerRelease extends UncaughtErrorHandler {
  @override
  Future<void> handleFlutterError(FlutterErrorDetails details) async {
    final String sException = details.exceptionAsString();
    final bool shouldKill = shouldKillApp(sException);
    if (shouldReportException(sException)) {
      await FirebaseCrashlytics.instance
          .recordFlutterError(details, fatal: shouldKill);
    }
    if (shouldKill) {
      _kill();
    }
  }

  @override
  Future<void> handleZonedError(dynamic exception, dynamic stack) async {
    final String sException = exception.toString();
    final bool shouldKill = shouldKillApp(sException);
    if (shouldReportException(sException)) {
      await FirebaseCrashlytics.instance
          .recordError(exception, stack, fatal: shouldKill);
    }
    if (shouldKill) {
      _kill();
    }
  }

  @override
  Future<void> reportUnexpectedError(
      Exception exception, StackTrace trace, String context,
      {bool? killApp = false}) async {
    await FirebaseCrashlytics.instance.recordError(exception, trace,
        reason: context, fatal: killApp ?? false);
    if (killApp ?? false) {
      _kill();
    }
  }

  @override
  Future<void> log(String msg) async {
    return FirebaseCrashlytics.instance.log(msg);
  }

  void _kill() {
    exit(10);
  }
}
