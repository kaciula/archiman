import 'package:json_annotation/json_annotation.dart';
import 'package:kt_dart/collection.dart';
import '../models/google_search_suggestion.dart';

part 'autocomplete_places_response.g.dart';

@JsonSerializable()
class AutocompletePlacesResponse {
  AutocompletePlacesResponse();

  factory AutocompletePlacesResponse.fromJson(Map<String, dynamic> json) =>
      _$AutocompletePlacesResponseFromJson(json);

  late String status;
  late List<_PredictionResponse> predictions;

  KtList<GoogleSearchSuggestion> map() {
    return predictions
        .map((_PredictionResponse response) => response.map())
        .toImmutableList();
  }
}

@JsonSerializable()
class _PredictionResponse {
  _PredictionResponse();

  factory _PredictionResponse.fromJson(Map<String, dynamic> json) =>
      _$PredictionResponseFromJson(json);

  @JsonKey(name: 'place_id')
  late String placeId;
  late String description;

  GoogleSearchSuggestion map() {
    return GoogleSearchSuggestion(id: placeId, name: description);
  }
}
