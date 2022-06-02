import 'package:flutter/material.dart';

abstract class UncaughtErrorHandler {
  Future<void> handleFlutterError(FlutterErrorDetails details);

  Future<void> handleZonedError(dynamic exception, dynamic stack);

  Future<void> reportUnexpectedError(
      Exception exception, StackTrace trace, String context,
      {bool? killApp});

  Future<void> log(String msg);
}
