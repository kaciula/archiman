import 'package:archiman/app/app_messenger.dart';
import 'package:archiman/app/app_navigator.dart';
import 'package:archiman/app/cubit/app_cubit.dart';
import 'package:archiman/features/common/data/local/app_info_store.dart';
import 'package:archiman/features/common/data/remote/logging_interceptor.dart';
import 'package:archiman/features/main/data/data_store.dart';
import 'package:archiman/features/main/data/remote_data_store.dart';
import 'package:archiman/services/generic/analytics_service.dart';
import 'package:archiman/services/generic/crash/crash_service.dart';
import 'package:archiman/services/generic/file_storage_service.dart';
import 'package:archiman/services/generic/log_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';

import '../app/app_constants.dart';

GetIt getIt = GetIt.instance;

Future<void> registerInstances() async {
  final AppInfoStore appInfoStore = AppInfoStore();
  getIt.registerSingleton<AppInfoStore>(appInfoStore);
  await appInfoStore.init();

  getIt.registerSingleton(AnalyticsService());
  final CrashService crashService = CrashService();
  getIt.registerSingleton(crashService);
  final FileStorageService fileStorageService = FileStorageService();
  getIt.registerSingleton(fileStorageService);
  final LogService logService =
      LogService(crashService, fileStorageService, appInfoStore);
  getIt.registerSingleton(logService);
  getIt.registerSingleton(RouteObserver());
  getIt.registerSingleton(AppMessenger());
  getIt.registerSingleton(AppNavigator());

  final Dio dio = _buildDio(logService, crashService);
  // getIt.registerSingleton<DataStore>(MockDataStore());
  getIt.registerSingleton<DataStore>(RemoteDataStore(dio, crashService));

  // Keep this at the end because it gets other dependencies injected into it
  getIt.registerSingleton(AppCubit());
}

Dio _buildDio(LogService logService, CrashService crashService) {
  final Dio dio = Dio();
  if (!isProduction) {
    dio.interceptors.add(
      LoggingInterceptor(logPrint: logService.logPrint, showCURL: true),
    );
  }
  return dio;
}
