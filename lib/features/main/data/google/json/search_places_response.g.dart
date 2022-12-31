// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_places_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchPlacesResponse _$SearchPlacesResponseFromJson(
        Map<String, dynamic> json) =>
    SearchPlacesResponse()
      ..candidates = (json['candidates'] as List<dynamic>)
          .map((e) => PlaceResponse.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SearchPlacesResponseToJson(
        SearchPlacesResponse instance) =>
    <String, dynamic>{
      'candidates': instance.candidates,
    };
