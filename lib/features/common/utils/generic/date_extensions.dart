import 'package:flutter/material.dart';

extension DateTimeExt on DateTime {
  DateTime withTime(TimeOfDay time) =>
      DateTime(year, month, day, time.hour, time.minute);

  bool isAfterNow() => isAfter(DateTime.now());

  bool isBeforeNow() => isBefore(DateTime.now());

  bool get isToday {
    final DateTime nowDate = DateTime.now();
    return year == nowDate.year && month == nowDate.month && day == nowDate.day;
  }

  bool get isFirstDayOfMonth => isSameDay(firstDayOfMonth, this);

  bool get isLastDayOfMonth => isSameDay(lastDayOfMonth, this);

  DateTime get firstDayOfMonth => DateTime(year, month);

  /// The last day of a given month
  DateTime get lastDayOfMonth {
    final DateTime beginningNextMonth =
        month < 12 ? DateTime(year, month + 1, 1) : DateTime(year + 1, 1, 1);
    return beginningNextMonth.subtract(Duration(days: 1));
  }

  DateTime get firstDayOfPreviousMonth {
    int year = this.year;
    int month = this.month;
    if (month == 1) {
      year--;
      month = 12;
    } else {
      month--;
    }
    return DateTime(year, month);
  }

  DateTime get firstDayOfNextMonth {
    int year = this.year;
    int month = this.month;

    if (month == 12) {
      year++;
      month = 1;
    } else {
      month++;
    }
    return DateTime(year, month);
  }

  bool get isInCurrentWeek => isSameWeek(this, DateTime.now());

  DateTime get firstDayOfWeek => subtract(Duration(days: weekday - 1));

  DateTime get lastDayOfWeek =>
      add(Duration(days: DateTime.daysPerWeek - weekday));

  /// Whether or not two times are on the same day.
  static bool isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  static bool isSameWeek(DateTime dateTime1, DateTime dateTime2) {
    return isSameDay(dateTime1.firstDayOfWeek, dateTime2.firstDayOfWeek);
  }

  static bool isSameMonth(DateTime dateTime1, DateTime dateTime2) {
    return isSameYear(dateTime1, dateTime2) &&
        dateTime1.month == dateTime2.month;
  }

  static bool isSameYear(DateTime dateTime1, DateTime dateTime2) {
    return dateTime1.year == dateTime2.year;
  }
}
