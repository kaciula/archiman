import 'package:permission_handler/permission_handler.dart' as permissions;
import 'package:universal_io/io.dart';

import 'device_info_service.dart';

class PermissionService {
  PermissionService(this.deviceInfoService);

  final DeviceInfoService deviceInfoService;

  Future<bool> isBluetoothPermissionSupported() async {
    return Platform.isIOS || await isAtLeastAndroid12();
  }

  Future<bool> hasBluetoothPermission() async {
    if (Platform.isIOS || !(await isAtLeastAndroid12())) {
      return await permissions.Permission.bluetooth.isGranted;
    } else {
      return await permissions.Permission.bluetoothScan.isGranted &&
          await permissions.Permission.bluetoothAdvertise.isGranted &&
          await permissions.Permission.bluetoothConnect.isGranted;
    }
  }

  Future<bool> isBluetoothPermissionGranted() async {
    if (Platform.isIOS || !(await isAtLeastAndroid12())) {
      return _map(await permissions.Permission.bluetooth.status) ==
          PermissionStatus.granted;
    } else {
      return _map(await permissions.Permission.bluetoothScan.status) ==
              PermissionStatus.granted &&
          _map(await permissions.Permission.bluetoothAdvertise.status) ==
              PermissionStatus.granted &&
          _map(await permissions.Permission.bluetoothConnect.status) ==
              PermissionStatus.granted;
    }
  }

  Future<PermissionStatus> requestBluetoothPermission() async {
    if (Platform.isIOS || !(await isAtLeastAndroid12())) {
      return _map(await permissions.Permission.bluetooth.request());
    } else {
      final PermissionStatus scanStatus =
          _map(await permissions.Permission.bluetoothScan.request());
      final PermissionStatus advertiseStatus =
          _map(await permissions.Permission.bluetoothAdvertise.request());
      final PermissionStatus connectedStatus =
          _map(await permissions.Permission.bluetoothConnect.request());
      if (scanStatus == PermissionStatus.granted &&
          advertiseStatus == PermissionStatus.granted &&
          connectedStatus == PermissionStatus.granted) {
        return PermissionStatus.granted;
      }
      if (scanStatus == PermissionStatus.deniedForever ||
          advertiseStatus == PermissionStatus.deniedForever ||
          connectedStatus == PermissionStatus.deniedForever) {
        return PermissionStatus.deniedForever;
      }
      return PermissionStatus.denied;
    }
  }

  bool isLocationPermissionSupported() {
    return Platform.isIOS || Platform.isAndroid;
  }

  Future<bool> hasLocationPermission() async {
    return await permissions.Permission.location.isGranted;
  }

  Future<bool> isLocationPermissionGranted() async {
    return _map(await permissions.Permission.location.status) ==
        PermissionStatus.granted;
  }

  Future<PermissionStatus> requestLocationPermission() async {
    return _map(await permissions.Permission.location.request());
  }

  bool isNotificationPermissionSupported() {
    return Platform.isIOS;
  }

  Future<bool> hasNotificationPermission() async {
    return await permissions.Permission.notification.isGranted;
  }

  Future<PermissionStatus> requestNotificationPermission() async {
    return _map(await permissions.Permission.notification.request());
  }

  bool isStoragePermissionSupported() {
    return Platform.isAndroid;
  }

  Future<bool> hasStoragePermission() async {
    return await permissions.Permission.storage.isGranted;
  }

  Future<PermissionStatus> requestStoragePermission() async {
    return _map(await permissions.Permission.storage.request());
  }

  bool isContactsPermissionSupported() {
    return Platform.isIOS || Platform.isAndroid;
  }

  Future<bool> hasContactsPermission() async {
    return await permissions.Permission.contacts.isGranted;
  }

  Future<bool> isContactsPermissionGranted() async {
    return _map(await permissions.Permission.contacts.status) ==
        PermissionStatus.granted;
  }

  Future<PermissionStatus> requestContactsPermission() async {
    return _map(await permissions.Permission.contacts.request());
  }

  bool isPhotosPermissionSupported() {
    return Platform.isIOS;
  }

  Future<bool> hasPhotosPermission() async {
    return await permissions.Permission.photos.isGranted;
  }

  Future<bool> isPhotosPermissionGranted() async {
    return _map(await permissions.Permission.photos.status) ==
        PermissionStatus.granted;
  }

  Future<PermissionStatus> requestPhotosPermission() async {
    return _map(await permissions.Permission.photos.request());
  }

  bool isCameraPermissionSupported() {
    return Platform.isIOS || Platform.isAndroid;
  }

  Future<bool> hasCameraPermission() async {
    return await permissions.Permission.camera.isGranted;
  }

  Future<bool> isCameraPermissionGranted() async {
    return _map(await permissions.Permission.camera.status) ==
        PermissionStatus.granted;
  }

  Future<PermissionStatus> requestCameraPermission() async {
    return _map(await permissions.Permission.camera.request());
  }

  bool isMicrophonePermissionSupported() {
    return Platform.isIOS || Platform.isAndroid;
  }

  Future<bool> hasMicrophonePermission() async {
    return await permissions.Permission.microphone.isGranted;
  }

  Future<bool> isMicrophonePermissionGranted() async {
    return _map(await permissions.Permission.microphone.status) ==
        PermissionStatus.granted;
  }

  Future<PermissionStatus> requestMicrophonePermission() async {
    return _map(await permissions.Permission.microphone.request());
  }

  PermissionStatus _map(permissions.PermissionStatus status) {
    switch (status) {
      case permissions.PermissionStatus.denied:
        return PermissionStatus.denied;
      case permissions.PermissionStatus.granted:
        return PermissionStatus.granted;
      case permissions.PermissionStatus.restricted:
        return PermissionStatus.deniedForever;
      case permissions.PermissionStatus.limited:
        return PermissionStatus.granted;
      case permissions.PermissionStatus.permanentlyDenied:
        return PermissionStatus.deniedForever;
    }
  }

  Future<void> goToPermissionSettings() async {
    await permissions.openAppSettings();
  }

  Future<bool> isAtLeastAndroid12() async {
    bool isAtLeastAndroid12 = false;
    if (Platform.isAndroid) {
      final int sdkVersion = await deviceInfoService.getAndroidSdkVersion();
      isAtLeastAndroid12 = sdkVersion >= 31;
    }
    return isAtLeastAndroid12;
  }
}

enum PermissionStatus { granted, denied, deniedForever }
