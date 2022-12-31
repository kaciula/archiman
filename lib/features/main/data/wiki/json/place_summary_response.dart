import 'package:json_annotation/json_annotation.dart';

part 'place_summary_response.g.dart';

@JsonSerializable()
class PlaceSummaryResponse {
  PlaceSummaryResponse();

  factory PlaceSummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaceSummaryResponseFromJson(json);

  late String extract;
  @JsonKey(name: 'content_urls')
  late _ContentUrlsResponse contentUrls;

  String get page => contentUrls.mobile.page;
}

@JsonSerializable()
class _ContentUrlsResponse {
  _ContentUrlsResponse();

  factory _ContentUrlsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContentUrlsResponseFromJson(json);

  late _MobileResponse mobile;
}

@JsonSerializable()
class _MobileResponse {
  _MobileResponse();

  factory _MobileResponse.fromJson(Map<String, dynamic> json) =>
      _$MobileResponseFromJson(json);

  late String page;
}
