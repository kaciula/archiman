import 'package:freezed_annotation/freezed_annotation.dart';

import '../models/google_place.dart';
import 'place_response.dart';

part 'place_details_response.g.dart';

@JsonSerializable()
class PlaceDetailsResponse {
  PlaceDetailsResponse();

  factory PlaceDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaceDetailsResponseFromJson(json);

  late PlaceResponse result;

  GooglePlace map() {
    return result.map();
  }
}
