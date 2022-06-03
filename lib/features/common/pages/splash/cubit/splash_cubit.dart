import 'package:archiman/app/app_locale.dart';
import 'package:archiman/app/app_messenger.dart';
import 'package:archiman/features/common/utils/generic/refresh_state.dart';
import 'package:archiman/infrastructure/local_stores/app_info_store.dart';
import 'package:archiman/start/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

import 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.initial());

  final AppInfoStore _appInfoStore = getIt<AppInfoStore>();
  final AppMessenger _appMessenger = getIt<AppMessenger>();

  void appStarted() async {
    await _onAppStart();
    await _decideWhatToDo();
  }

  Future<void> refreshRequested() async {
    await _decideWhatToDo();
  }

  Future<void> _decideWhatToDo() async {
    await Future<void>.delayed(
      Duration(seconds: 4),
      () => emit(state.copyWith(refreshState: RefreshState.success())),
    );

    await Future<void>.delayed(
      Duration(seconds: 2),
      () => _appMessenger.showInfoSnackBar('Hello'),
    );
  }

  Future<void> _onAppStart() async {
    await AppLocale.init();

    final AppInfo appInfo = await _appInfoStore.get();
    _logger.fine('version code = ${appInfo.currentVersionCode}');
    if (appInfo.isFirstTime) {
      _logger.info('First time running the app');
      _appInfoStore.save(
          isFirstTime: false, versionCode: appInfo.currentVersionCode);
    } else {
      if (appInfo.oldVersionCode < appInfo.currentVersionCode) {
        _logger.info(
            'Old version code ${appInfo.oldVersionCode} replaced with ${appInfo.currentVersionCode}');
        await _appInfoStore.save(
            isFirstTime: false, versionCode: appInfo.currentVersionCode);
      } else {
        _logger.info('Just a basic cold start');
      }
    }
  }
}

// ignore: unused_element
final Logger _logger = Logger('SplashCubit');
