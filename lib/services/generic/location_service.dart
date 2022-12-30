import 'dart:async';

import 'package:app_settings/app_settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:logging/logging.dart';
import 'package:universal_io/io.dart';

part 'location_service.freezed.dart';

class LocationService {
  Future<bool> isLocationEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
    // return await Location().serviceEnabled();
  }

  Future<void> enableLocation() async {
    if (Platform.isAndroid) {
      await Location().requestService();
    } else {
      await AppSettings.openLocationSettings();
    }
  }

  Future<void> goToLocationSettings() async {
    await Geolocator.openAppSettings();
  }

  Future<CurrentPositionResult> currentPosition() async {
    try {
      final Position position = await Geolocator.getCurrentPosition();
      return CurrentPositionSuccess(_map(position));
    } on TimeoutException catch (e) {
      _logger.warning(e);
      return CurrentPositionTimeout();
    } on LocationServiceDisabledException catch (e) {
      _logger.warning(e);
      return CurrentPositionServiceDisabled();
    }
  }

  double distance(LocationPosition position1, LocationPosition position2) {
    return Geolocator.distanceBetween(
        position1.lat, position1.lng, position2.lat, position2.lng);
  }

  LocationPosition _map(Position position) {
    return LocationPosition(lat: position.latitude, lng: position.longitude);
  }
}

@freezed
class CurrentPositionResult with _$CurrentPositionResult {
  factory CurrentPositionResult.success(LocationPosition position) =
      CurrentPositionSuccess;

  factory CurrentPositionResult.timeout() = CurrentPositionTimeout;

  factory CurrentPositionResult.serviceDisabled() =
      CurrentPositionServiceDisabled;
}

@freezed
class LocationPosition with _$LocationPosition {
  factory LocationPosition({
    required double lat,
    required double lng,
  }) = _LocationPosition;
}

// ignore: unused_element
final Logger _logger = Logger('LocationService');
