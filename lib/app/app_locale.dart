import 'dart:ui';

import 'package:auto_localized/auto_localized.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl_standalone.dart';
import 'package:logging/logging.dart';

class AppLocale {
  AppLocale._();

  static String get languageCode => currentLocale.languageCode;

  static Locale get currentLocale => AutoLocalization.instance.locale;

  static Future<void> init() async {
    await findSystemLocale();
    await initializeDateFormatting();

    _logger.fine('Current locale is $currentLocale');
  }

  static void updateLocale(Locale locale) {
    AutoLocalization.updateLocale(locale);
  }
}

const Locale englishLocale = Locale('en');

// ignore: unused_element
final Logger _logger = Logger('AppLocale');
