// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceResponse _$PlaceResponseFromJson(Map<String, dynamic> json) =>
    PlaceResponse()
      ..placeId = json['place_id'] as String
      ..name = json['name'] as String
      ..geometry =
          _GeometryResponse.fromJson(json['geometry'] as Map<String, dynamic>);

Map<String, dynamic> _$PlaceResponseToJson(PlaceResponse instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
      'name': instance.name,
      'geometry': instance.geometry,
    };

_GeometryResponse _$GeometryResponseFromJson(Map<String, dynamic> json) =>
    _GeometryResponse()
      ..location =
          _LocationResponse.fromJson(json['location'] as Map<String, dynamic>);

Map<String, dynamic> _$GeometryResponseToJson(_GeometryResponse instance) =>
    <String, dynamic>{
      'location': instance.location,
    };

_LocationResponse _$LocationResponseFromJson(Map<String, dynamic> json) =>
    _LocationResponse()
      ..lat = (json['lat'] as num).toDouble()
      ..lng = (json['lng'] as num).toDouble();

Map<String, dynamic> _$LocationResponseToJson(_LocationResponse instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
