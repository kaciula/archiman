// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unnecessary_const, constant_identifier_names

// **************************************************************************
// AutoLocalizedGenerator
// **************************************************************************

import 'package:auto_localized/auto_localized.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

@immutable
class AutoLocalizedData {
  static const supportedLocales = <Locale>[
    Locale('en'),
  ];

  static const delegate = AutoLocalizationDelegate(supportedLocales);

  static const localizationsDelegates = [
    GlobalWidgetsLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    delegate,
  ];
}

extension AutoLocalizedContextExtension on BuildContext {
  List<Locale> get supportedLocales => AutoLocalizedData.supportedLocales;

  List<LocalizationsDelegate> get localizationsDelegates =>
      AutoLocalizedData.localizationsDelegates;

  String translate(
    LocalizedString string, [
    String arg1 = "",
    String arg2 = "",
    String arg3 = "",
    String arg4 = "",
    String arg5 = "",
  ]) =>
      string.when(
        plain: (string) => string.get(this),
        arg1: (string) => string.get(arg1, this),
        arg2: (string) => string.get(arg1, arg2, this),
        arg3: (string) => string.get(arg1, arg2, arg3, this),
        arg4: (string) => string.get(arg1, arg2, arg3, arg4, this),
        arg5: (string) => string.get(arg1, arg2, arg3, arg4, arg5, this),
      );
}

@immutable
class Strings {
  const Strings._();
  static const genericNoInternetTitle = PlainLocalizedString(
    key: 'genericNoInternetTitle',
    values: {
      'en': '''Connect to the Internet''',
    },
  );

  static const genericNoInternetMsg = PlainLocalizedString(
    key: 'genericNoInternetMsg',
    values: {
      'en': '''You have no Internet connection. Check your connection.''',
    },
  );

  static const genericErrorTitle = PlainLocalizedString(
    key: 'genericErrorTitle',
    values: {
      'en': '''Oops!''',
    },
  );

  static const genericErrorMsg = PlainLocalizedString(
    key: 'genericErrorMsg',
    values: {
      'en': '''Something unexpected happened. Please try again.''',
    },
  );

  static const genericRetry = PlainLocalizedString(
    key: 'genericRetry',
    values: {
      'en': '''Retry''',
    },
  );

  static const genericSearch = PlainLocalizedString(
    key: 'genericSearch',
    values: {
      'en': '''Search''',
    },
  );

  static const genericNoSearchResults = PlainLocalizedString(
    key: 'genericNoSearchResults',
    values: {
      'en': '''No results.''',
    },
  );

  static const genericYes = PlainLocalizedString(
    key: 'genericYes',
    values: {
      'en': '''Yes''',
    },
  );

  static const genericNo = PlainLocalizedString(
    key: 'genericNo',
    values: {
      'en': '''No''',
    },
  );

  static const genericYesterday = PlainLocalizedString(
    key: 'genericYesterday',
    values: {
      'en': '''Yesterday''',
    },
  );

  static const genericOk = PlainLocalizedString(
    key: 'genericOk',
    values: {
      'en': '''OK''',
    },
  );

  static const details = PlainLocalizedString(
    key: 'details',
    values: {
      'en': '''DETAILS''',
    },
  );
}
