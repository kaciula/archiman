// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceSummaryResponse _$PlaceSummaryResponseFromJson(
        Map<String, dynamic> json) =>
    PlaceSummaryResponse()
      ..extract = json['extract'] as String
      ..contentUrls = _ContentUrlsResponse.fromJson(
          json['content_urls'] as Map<String, dynamic>);

Map<String, dynamic> _$PlaceSummaryResponseToJson(
        PlaceSummaryResponse instance) =>
    <String, dynamic>{
      'extract': instance.extract,
      'content_urls': instance.contentUrls,
    };

_ContentUrlsResponse _$ContentUrlsResponseFromJson(Map<String, dynamic> json) =>
    _ContentUrlsResponse()
      ..mobile =
          _MobileResponse.fromJson(json['mobile'] as Map<String, dynamic>);

Map<String, dynamic> _$ContentUrlsResponseToJson(
        _ContentUrlsResponse instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
    };

_MobileResponse _$MobileResponseFromJson(Map<String, dynamic> json) =>
    _MobileResponse()..page = json['page'] as String;

Map<String, dynamic> _$MobileResponseToJson(_MobileResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
    };
