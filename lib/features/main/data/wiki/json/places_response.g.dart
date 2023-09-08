// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlacesResponse _$PlacesResponseFromJson(Map<String, dynamic> json) =>
    PlacesResponse()
      ..query = QueryResponse.fromJson(json['query'] as Map<String, dynamic>);

Map<String, dynamic> _$PlacesResponseToJson(PlacesResponse instance) =>
    <String, dynamic>{
      'query': instance.query,
    };

QueryResponse _$QueryResponseFromJson(Map<String, dynamic> json) =>
    QueryResponse()
      ..geosearch = (json['geosearch'] as List<dynamic>)
          .map((e) => PlaceResponse.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$QueryResponseToJson(QueryResponse instance) =>
    <String, dynamic>{
      'geosearch': instance.geosearch,
    };

PlaceResponse _$PlaceResponseFromJson(Map<String, dynamic> json) =>
    PlaceResponse()
      ..pageid = json['pageid'] as int
      ..title = json['title'] as String
      ..lat = (json['lat'] as num).toDouble()
      ..lon = (json['lon'] as num).toDouble()
      ..dist = (json['dist'] as num).toDouble();

Map<String, dynamic> _$PlaceResponseToJson(PlaceResponse instance) =>
    <String, dynamic>{
      'pageid': instance.pageid,
      'title': instance.title,
      'lat': instance.lat,
      'lon': instance.lon,
      'dist': instance.dist,
    };
