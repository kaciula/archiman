import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_place.freezed.dart';

@freezed
class GooglePlace with _$GooglePlace {
  factory GooglePlace({
    required String id,
    required String name,
    required LocationPoint location,
  }) = _GooglePlace;
}

@freezed
class LocationPoint with _$LocationPoint {
  factory LocationPoint({
    required double lat,
    required double lng,
  }) = _LocationPoint;
}
