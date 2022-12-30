import 'package:archiman/services/generic/crash/crash_service.dart';
import 'package:archiman/services/generic/log_service.dart';
import 'package:flutter/services.dart';

import 'service_locator.dart';

Future<void> init() async {
  final CrashService crashService = getIt<CrashService>();
  final LogService logService = getIt<LogService>();

  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);

  await logService.init();
  await crashService.init();
}
