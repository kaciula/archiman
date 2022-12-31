import 'package:json_annotation/json_annotation.dart';

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
  late _GeometryResponse geometry;

  GooglePlace map() {
    return GooglePlace(
      id: placeId,
      name: name,
      location: geometry.map(),
    );
  }
}

@JsonSerializable()
class _GeometryResponse {
  _GeometryResponse();

  factory _GeometryResponse.fromJson(Map<String, dynamic> json) =>
      _$GeometryResponseFromJson(json);

  late _LocationResponse location;

  LocationPoint map() {
    return LocationPoint(lat: location.lat, lng: location.lng);
  }
}

@JsonSerializable()
class _LocationResponse {
  _LocationResponse();

  factory _LocationResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseFromJson(json);

  late double lat;
  late double lng;
}
