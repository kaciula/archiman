import 'package:app_settings/app_settings.dart';
import 'package:flutter_blue_elves/flutter_blue_elves.dart';
import 'package:universal_io/io.dart';

class BluetoothService {
  Future<bool> isBluetoothEnabled() async {
    if (Platform.isAndroid) {
      final List<AndroidBluetoothLack> lacks =
          await FlutterBlueElves.instance.androidCheckBlueLackWhat();
      return !lacks.contains(AndroidBluetoothLack.bluetoothFunction);
    } else {
      // iOS
      final IosBluetoothState state =
          await FlutterBlueElves.instance.iosCheckBluetoothState();
      return state != IosBluetoothState.poweredOff;
    }
  }

  Future<void> enableBluetooth() async {
    if (Platform.isAndroid) {
      FlutterBlueElves.instance
          .androidOpenBluetoothService((bool isOk) => null);
    } else {
      // iOS
      await AppSettings.openBluetoothSettings();
    }
  }
}
