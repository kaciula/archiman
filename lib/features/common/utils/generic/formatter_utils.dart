import 'package:archiman/app/app_locale.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class FormatterUtils {
  FormatterUtils._();

  static String date(DateTime date) {
    return DateFormat.yMd(AppLocale.languageCode).format(date);
  }

  static String dateWithDash(DateTime date) {
    return DateFormat('MM-dd-yyyy').format(date);
  }

  static String timeOnly(DateTime date) {
    return DateFormat.jm(AppLocale.languageCode).format(date);
  }

  static String time(TimeOfDay timeOfDay) {
    final DateTime now = DateTime.now();
    return DateFormat.jm(AppLocale.languageCode).format(DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute));
  }

  static String dateTime(DateTime date) {
    return DateFormat.yMd(AppLocale.languageCode).add_jm().format(date);
  }

  static String dayMonthYear(DateTime date) {
    return DateFormat.yMMMMd(AppLocale.languageCode).format(date);
  }

  static String dayMonthYearTime(DateTime date) {
    return DateFormat.yMMMMd(AppLocale.languageCode).add_j().format(date);
  }

  static String fullDate(DateTime date) {
    return DateFormat.yMMMMd(AppLocale.languageCode).add_jm().format(date);
  }

  static String month(DateTime date) {
    return DateFormat.MMM(AppLocale.languageCode).format(date);
  }

  static String weekdayMonth(DateTime date) {
    return DateFormat('EEEE d, MMM').format(date);
  }

  static String weekdayMonthYear(DateTime date) {
    return DateFormat('EEEE d, MMM, yyyy').format(date);
  }

  static String weekday(DateTime date) {
    switch (date.weekday) {
      case 1:
        return 'M';
      case 2:
        return 'T';
      case 3:
        return 'W';
      case 4:
        return 'T';
      case 5:
        return 'F';
      case 6:
        return 'S';
      case 7:
        return 'S';
    }
    throw Exception('Unknown weekday $date');
  }

  static String timeAgo(DateTime dateTime) {
    return timeago.format(
      dateTime,
      locale: AppLocale.currentLocale.languageCode,
    );
  }

  static String hourOnly(DateTime date) {
    return DateFormat.j(AppLocale.languageCode).format(date);
  }

  static String numWithDecimals(double value, {int numDecimalDigits = 1}) {
    return value.toStringAsFixed(
        value.truncateToDouble() == value ? 0 : numDecimalDigits);
  }
}
