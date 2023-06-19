import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

import '../models/wiki_place.dart';

part 'places_response.g.dart';

@JsonSerializable()
class PlacesResponse {
  PlacesResponse();

  factory PlacesResponse.fromJson(Map<String, dynamic> json) =>
      _$PlacesResponseFromJson(json);

  late QueryResponse query;

  KtList<WikiPlace> map() {
    return query.geosearch
        .map((PlaceResponse response) => response.map())
        .toImmutableList();
  }
}

@JsonSerializable()
class QueryResponse {
  QueryResponse();

  factory QueryResponse.fromJson(Map<String, dynamic> json) =>
      _$QueryResponseFromJson(json);

  late List<PlaceResponse> geosearch;
}

@JsonSerializable()
class PlaceResponse {
  PlaceResponse();

  factory PlaceResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaceResponseFromJson(json);

  late int pageid;
  late String title;
  late double lat;
  late double lon;
  late double dist;

  WikiPlace map() {
    return WikiPlace(
      wikiId: pageid,
      title: title,
      location: LocationPoint(lat: lat, lng: lon),
      webPage: 'https://en.m.wikipedia.org/wiki?curid=$pageid',
      distance: dist,
    );
  }
}
