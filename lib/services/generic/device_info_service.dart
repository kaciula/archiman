import 'package:device_info_plus/device_info_plus.dart';
import 'package:universal_io/io.dart';

class DeviceInfoService {
  final DeviceInfoPlugin _plugin = DeviceInfoPlugin();

  Future<Map<String, dynamic>> getEverything() async {
    final BaseDeviceInfo deviceInfo = await _plugin.deviceInfo;
    return deviceInfo.toMap();
  }

  Future<int> getAndroidSdkVersion() async {
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo =
          await DeviceInfoPlugin().androidInfo;
      return androidInfo.version.sdkInt!;
    } else {
      throw Exception('Do not call this method if not running on Android');
    }
  }
}
