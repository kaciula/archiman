import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

import '../models/google_place.dart';
import 'place_response.dart';

part 'search_places_response.g.dart';

@JsonSerializable()
class SearchPlacesResponse {
  SearchPlacesResponse();

  factory SearchPlacesResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchPlacesResponseFromJson(json);

  late List<PlaceResponse> candidates;

  KtList<GooglePlace> map() {
    return candidates
        .map((PlaceResponse response) => response.map())
        .toImmutableList();
  }
}
