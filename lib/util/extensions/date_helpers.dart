import 'package:intl/intl.dart';

extension DateHelpers on DateTime {
  bool get isNow {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year && now.hour == hour;
  }

  bool get isToday {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  String get getWeekDayName {
    return DateFormat('EEE').format(this);
  }
}
