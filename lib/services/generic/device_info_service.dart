import 'package:device_info_plus/device_info_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:universal_io/io.dart';

part 'device_info_service.freezed.dart';

class DeviceInfoService {
  final DeviceInfoPlugin _plugin = DeviceInfoPlugin();

  Future<DeviceInfo> readInfo() async {
    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo =
          await DeviceInfoPlugin().androidInfo;
      return DeviceInfo(
        brand: androidInfo.brand ?? 'n/a',
        model: androidInfo.model ?? 'n/a',
        version: androidInfo.version.sdkInt.toString(),
        id: androidInfo.id ?? 'n/a',
      );
    } else {
      final IosDeviceInfo iosInfo = await DeviceInfoPlugin().iosInfo;
      return DeviceInfo(
        brand: 'Apple',
        model: iosInfo.utsname.machine ?? 'n/a',
        version: iosInfo.systemVersion ?? 'n/a',
        id: iosInfo.identifierForVendor ?? 'n/a',
      );
    }
  }

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

@freezed
class DeviceInfo with _$DeviceInfo {
  factory DeviceInfo({
    required String brand,
    required String model,
    required String version,
    required String id,
  }) = _DeviceInfo;
}
