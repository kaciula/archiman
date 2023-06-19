import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:universal_io/io.dart';

part 'device_service.freezed.dart';

class DeviceService {
  Future<DeviceInfo> readInfo() async {
    final String installationId = await FirebaseInstallations.instance.getId();

    if (Platform.isAndroid) {
      final AndroidDeviceInfo androidInfo =
          await DeviceInfoPlugin().androidInfo;
      return DeviceInfo(
        installationId: installationId,
        recognizableName: '${androidInfo.brand} ${androidInfo.model}',
        osVersion: androidInfo.version.sdkInt.toString(),
      );
    } else {
      final IosDeviceInfo iosInfo = await DeviceInfoPlugin().iosInfo;
      return DeviceInfo(
        installationId: installationId,
        recognizableName: 'Apple ${iosInfo.name ?? iosInfo.model}',
        osVersion: iosInfo.systemVersion ?? 'n/a',
      );
    }
  }
}

@freezed
class DeviceInfo with _$DeviceInfo {
  factory DeviceInfo({
    required String installationId,
    required String recognizableName,
    required String osVersion,
  }) = _DeviceInfo;
}
