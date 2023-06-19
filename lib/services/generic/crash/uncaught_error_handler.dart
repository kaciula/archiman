import 'package:archiman/features/common/utils/generic/string_extension.dart';
import 'package:flutter/material.dart';

abstract class UncaughtErrorHandler {
  Future<void> handleFlutterError(FlutterErrorDetails details);

  Future<void> handleZonedError(dynamic exception, dynamic stack);

  Future<void> reportUnexpectedError(
      Exception exception, StackTrace trace, String context,
      {bool? killApp});

  Future<void> log(String msg);
}

bool shouldKillApp(String sException) {
  return !sException.containsIgnoreCase('Failed to load') &&
      !sException.containsIgnoreCase('Codec failed to produce an image') &&
      !sException.containsIgnoreCase('VideoError') &&
      !sException.containsIgnoreCase('HttpException') &&
      !sException.containsIgnoreCase(
          'Bad state: Stream has already been listened to') &&
      !sException.containsIgnoreCase('Invalid image data') &&
      !sException.containsIgnoreCase('NetworkImage is an empty file') &&
      !sException.containsIgnoreCase('[firebase_remote_config/internal]');
}

bool shouldReportException(String sException) {
  return !sException.containsIgnoreCase('Failed to load') &&
      !sException.containsIgnoreCase('VideoError');
}
