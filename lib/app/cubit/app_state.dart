import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_theme.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    required AppTheme appTheme,
  }) = _AppState;

  factory AppState.initial(AppTheme appTheme) {
    return AppState(
      appTheme: appTheme,
    );
  }
}
