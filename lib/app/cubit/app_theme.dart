import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_theme.freezed.dart';

@freezed
class AppTheme with _$AppTheme {
  factory AppTheme({
    required ThemeMode themeMode,
  }) = _AppTheme;

  AppTheme._();

  factory AppTheme.initial(ThemeMode themeMode) {
    return AppTheme(
      themeMode: themeMode,
    );
  }

  ThemeData get themeData {
    return ThemeData(
      brightness: Brightness.light,
    );
  }

  ThemeData get darkThemeData {
    return ThemeData(
      brightness: Brightness.dark,
    );
  }
}
