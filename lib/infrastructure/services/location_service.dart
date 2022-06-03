import 'package:app_settings/app_settings.dart';
import 'package:location/location.dart';
import 'package:universal_io/io.dart';

class LocationService {
  Future<bool> isLocationEnabled() async {
    return await Location().serviceEnabled();
  }

  Future<void> enableLocation() async {
    if (Platform.isAndroid) {
      await Location().requestService();
    } else {
      await AppSettings.openLocationSettings();
    }
  }
}
