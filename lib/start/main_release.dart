import 'dart:async';

import 'package:archiman/app/app.dart';
import 'package:archiman/services/generic/crash/crash_service.dart';
import 'package:flutter/material.dart';

import 'main_utils.dart';
import 'service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await registerInstances();
  await init();

  startApp();
}

void startApp() {
  runZonedGuarded<Future<void>>(() async {
    runApp(const ThisApp());
  }, (Object error, StackTrace stack) async {
    await getIt<CrashService>().handleZonedError(error, stack);
  });
}
