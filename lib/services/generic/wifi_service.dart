import 'package:network_info_plus/network_info_plus.dart';

class WifiService {
  Future<String> getWifiName() async {
    final String? wifiName = await NetworkInfo().getWifiName();
    return wifiName ?? '';
  }
}
