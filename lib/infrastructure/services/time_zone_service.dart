import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone_utc_offset/timezone_utc_offset.dart';

class TimeZoneService {
  Future<String> getCurrentTimeZone() async {
    return await FlutterNativeTimezone.getLocalTimezone();
  }

  Future<int> getTimeZoneOffsetMin(String timeZone) async {
    // Server needs to keep account of Daylights Saving Time
    return getTimezoneUTCOffset(timeZone)!.inMinutes;
  }
}
