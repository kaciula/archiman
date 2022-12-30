import 'dart:developer' as developer;
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:universal_io/io.dart';

import '../../features/common/data/local/app_info_store.dart';
import 'crash/crash_service.dart';
import 'file_storage_service.dart';

class LogService {
  LogService(this.crashService, this.fileStorageService, this.appInfoStore);

  final CrashService crashService;
  final FileStorageService fileStorageService;
  final AppInfoStore appInfoStore;

  final List<String> memoryLogs = <String>[];
  bool _keepLogsInMemory = false;
  bool _keepLogsInFile = false;
  late File logFile;

  bool get trackLogsInMemory => _keepLogsInMemory;

  set trackLogsInMemory(bool value) {
    _keepLogsInMemory = value;
    _setLoggerLevel();
    memoryLogs.clear();
  }

  bool get trackLogsInFile => _keepLogsInFile;

  set trackLogsInFile(bool isEnabled) {
    _keepLogsInFile = isEnabled;
    _setLoggerLevel();

    // Clear log file
    logFile.writeAsStringSync('');

    appInfoStore.saveTrackLogsInFile(isEnabled);
  }

  Future<void> init() async {
    _keepLogsInFile = appInfoStore.trackLogsInFile();
    logFile = fileStorageService.appSupportFile('dev-logs.log');
    _setLoggerLevel();
    Logger.root.onRecord.listen(log);
  }

  void log(LogRecord record) {
    final String msg =
        '${record.time.hour}:${record.time.minute}:${record.time.second}.${record.time.millisecond} ${record.loggerName}: ${record.message}';
    if (kReleaseMode) {
      crashService.log(msg);
    } else {
      const String lightGrey = '\x1b[90m';
      String start = lightGrey;
      const String end = '\x1b[0m';
      const String white = '\x1b[37m';

      switch (record.level.name) {
        case 'FINEST':
          start = '\x1b[96m';
          break;
        case 'INFO':
          start = white;
          break;
        case 'WARNING':
          start = '\x1b[93m';
          break;
        case 'SEVERE':
          start = '\x1b[103m\x1b[31m';
          break;
        case 'SHOUT':
          start = '\x1b[41m\x1b[93m';
          break;
      }

      final String shortMessage =
          record.message.substring(0, min(2400, record.message.length));
      final String message =
          '$lightGrey${record.time.hour}:${record.time.minute}:${record.time.second}:$end$start $shortMessage$end';
      developer.log(
        message,
        name: record.loggerName.padRight(25),
        level: record.level.value,
        time: record.time,
      );
    }

    if (_keepLogsInMemory) {
      memoryLogs.add(msg);
    }
    if (_keepLogsInFile) {
      logFile.writeAsStringSync('$msg\n', mode: FileMode.append);
    }
  }

  void logPrint(dynamic message) {
    log(LogRecord(Level.FINEST, message, 'Network'));
  }

  void _setLoggerLevel() {
    Logger.root.level = (kReleaseMode && !_keepLogsInMemory && !_keepLogsInFile)
        ? Level.INFO
        : Level.ALL;
  }
}

// ignore: unused_element
class _LoggingBlocObserver extends BlocObserver {
  _LoggingBlocObserver(this.crashService);

  final CrashService crashService;

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    super.onEvent(bloc, event);
    Logger(bloc.runtimeType.toString()).info(event);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    crashService.reportUnexpectedError(
      Exception(error.toString()),
      stackTrace,
      '${bloc.runtimeType.toString()} exploded!',
      killApp: true,
    );
  }
}

// ignore: unused_element
final Logger _logger = Logger('LogService');
