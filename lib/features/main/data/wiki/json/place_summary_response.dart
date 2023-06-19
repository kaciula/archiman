import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_summary_response.g.dart';

@JsonSerializable()
class PlaceSummaryResponse {
  PlaceSummaryResponse();

  factory PlaceSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaceSummaryResponseFromJson(json);

  late String extract;
  @JsonKey(name: 'content_urls')
  late ContentUrlsResponse contentUrls;

  String get page => contentUrls.mobile.page;
}

@JsonSerializable()
class ContentUrlsResponse {
  ContentUrlsResponse();

  factory ContentUrlsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContentUrlsResponseFromJson(json);

  late MobileResponse mobile;
}

@JsonSerializable()
class MobileResponse {
  MobileResponse();

  factory MobileResponse.fromJson(Map<String, dynamic> json) =>
      _$MobileResponseFromJson(json);

  late String page;
}
