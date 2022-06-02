import 'package:archiman/infrastructure/local_stores/app_info_store.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

import 'uncaught_error_handler.dart';

class UncaughtErrorHandlerRelease extends UncaughtErrorHandler {
  UncaughtErrorHandlerRelease(this.appInfoStore);

  final AppInfoStore appInfoStore;

  @override
  Future<void> handleFlutterError(FlutterErrorDetails details) async {
    await FirebaseCrashlytics.instance.recordFlutterError(details);
    _kill();
  }

  @override
  Future<void> handleZonedError(dynamic exception, dynamic stack) async {
    await FirebaseCrashlytics.instance.recordError(exception, stack);
    _kill();
  }

  @override
  Future<void> reportUnexpectedError(
      Exception exception, StackTrace trace, String context,
      {bool? killApp = false}) async {
    await FirebaseCrashlytics.instance
        .recordError(exception, trace, reason: context);
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
