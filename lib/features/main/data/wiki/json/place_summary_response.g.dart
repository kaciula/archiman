// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_summary_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceSummaryResponse _$PlaceSummaryResponseFromJson(
        Map<String, dynamic> json) =>
    PlaceSummaryResponse()
      ..extract = json['extract'] as String
      ..contentUrls = ContentUrlsResponse.fromJson(
          json['content_urls'] as Map<String, dynamic>);

Map<String, dynamic> _$PlaceSummaryResponseToJson(
        PlaceSummaryResponse instance) =>
    <String, dynamic>{
      'extract': instance.extract,
      'content_urls': instance.contentUrls,
    };

ContentUrlsResponse _$ContentUrlsResponseFromJson(Map<String, dynamic> json) =>
    ContentUrlsResponse()
      ..mobile =
          MobileResponse.fromJson(json['mobile'] as Map<String, dynamic>);

Map<String, dynamic> _$ContentUrlsResponseToJson(
        ContentUrlsResponse instance) =>
    <String, dynamic>{
      'mobile': instance.mobile,
    };

MobileResponse _$MobileResponseFromJson(Map<String, dynamic> json) =>
    MobileResponse()..page = json['page'] as String;

Map<String, dynamic> _$MobileResponseToJson(MobileResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
    };
