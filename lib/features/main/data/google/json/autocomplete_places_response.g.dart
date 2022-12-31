// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocomplete_places_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutocompletePlacesResponse _$AutocompletePlacesResponseFromJson(
        Map<String, dynamic> json) =>
    AutocompletePlacesResponse()
      ..status = json['status'] as String
      ..predictions = (json['predictions'] as List<dynamic>)
          .map((e) => _PredictionResponse.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$AutocompletePlacesResponseToJson(
        AutocompletePlacesResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'predictions': instance.predictions,
    };

_PredictionResponse _$PredictionResponseFromJson(Map<String, dynamic> json) =>
    _PredictionResponse()
      ..placeId = json['place_id'] as String
      ..description = json['description'] as String;

Map<String, dynamic> _$PredictionResponseToJson(_PredictionResponse instance) =>
    <String, dynamic>{
      'place_id': instance.placeId,
      'description': instance.description,
    };
