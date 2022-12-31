import 'package:freezed_annotation/freezed_annotation.dart';

part 'wiki_place.freezed.dart';

@freezed
class WikiPlace with _$WikiPlace {
  factory WikiPlace({
    required int wikiId,
    required String title,
    required LocationPoint location,
    required String webPage,
    required double distance,
  }) = _WikiPlace;
}

@freezed
class LocationPoint with _$LocationPoint {
  factory LocationPoint({
    required double lat,
    required double lng,
  }) = _LocationPoint;
}
