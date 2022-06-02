import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

import 'app_state.dart';
import 'app_theme.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(_initialState());

  void appStarted() {}

  void appResumed() {}

  void appPaused() {}

  static AppState _initialState() {
    return AppState.initial(
      AppTheme.initial(ThemeMode.light),
    );
  }
}

// ignore: unused_element
final Logger _logger = Logger('AppCubit');
