import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/google_place.dart';

part 'place_response.g.dart';

@JsonSerializable()
class PlaceResponse {
  PlaceResponse();

  factory PlaceResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaceResponseFromJson(json);

  @JsonKey(name: 'place_id')
  late String placeId;
  late String name;
  late GeometryResponse geometry;

  GooglePlace map() {
    return GooglePlace(
      id: placeId,
      name: name,
      location: geometry.map(),
    );
  }
}

@JsonSerializable()
class GeometryResponse {
  GeometryResponse();

  factory GeometryResponse.fromJson(Map<String, dynamic> json) =>
      _$GeometryResponseFromJson(json);

  late LocationResponse location;

  LocationPoint map() {
    return LocationPoint(lat: location.lat, lng: location.lng);
  }
}

@JsonSerializable()
class LocationResponse {
  LocationResponse();

  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseFromJson(json);

  late double lat;
  late double lng;
}
