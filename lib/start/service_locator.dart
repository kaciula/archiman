import 'package:archiman/app/app_messenger.dart';
import 'package:archiman/app/app_navigator.dart';
import 'package:archiman/app/cubit/app_cubit.dart';
import 'package:archiman/infrastructure/local_stores/app_info_store.dart';
import 'package:archiman/infrastructure/misc/analytics.dart';
import 'package:archiman/infrastructure/misc/crash/crash_reporter.dart';
import 'package:archiman/infrastructure/misc/fire.dart';
import 'package:archiman/infrastructure/services/log_service.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

Future<void> registerInstances() async {
  final AppInfoStore appInfoStore = AppInfoStore();
  getIt.registerSingleton<AppInfoStore>(appInfoStore);
  await appInfoStore.init();

  final Fire fire = Fire();
  getIt.registerSingleton(fire);
  // We need to initialize Firebase here because the connectors constructors need this
  await fire.init();
  getIt.registerSingleton(Analytics());
  final CrashReporter crashReporter = CrashReporter(appInfoStore);
  getIt.registerSingleton(crashReporter);
  final LogService logService = LogService(crashReporter);
  getIt.registerSingleton(logService);
  getIt.registerSingleton(RouteObserver());
  getIt.registerSingleton(AppMessenger());
  getIt.registerSingleton(AppNavigator());

  // Keep this at the end because it gets other dependencies injected into it
  getIt.registerSingleton(AppCubit());
}
