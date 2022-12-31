// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceDetailsResponse _$PlaceDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    PlaceDetailsResponse()
      ..result = PlaceResponse.fromJson(json['result'] as Map<String, dynamic>);

Map<String, dynamic> _$PlaceDetailsResponseToJson(
        PlaceDetailsResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
    };
