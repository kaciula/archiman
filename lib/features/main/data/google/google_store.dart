import 'dart:convert';
import 'package:universal_io/io.dart';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:logging/logging.dart';
import 'json/autocomplete_places_response.dart';
import 'json/place_details_response.dart';
import 'json/search_places_response.dart';
import 'json/synthesize_text_request.dart';
import 'models/google_place.dart';
import 'models/google_search_suggestion.dart';

part 'google_store.freezed.dart';

class GoogleStore {
  GoogleStore(this.dio);

  final Dio dio;

  Future<SearchPlacesResult> searchPlaces(String input) async {
    try {
      final Response<dynamic> response = await dio.get(
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json',
        queryParameters: <String, dynamic>{
          'key': _googleApiKey,
          'input': input,
          'inputtype': 'textquery',
          'fields': 'place_id,name,geometry'
        },
      );
      final SearchPlacesResponse placesResponse =
          SearchPlacesResponse.fromJson(response.data);
      return SearchPlacesSuccess(placesResponse.map());
    } on DioError catch (e) {
      _logger.warning(e.toString());
      return SearchPlacesFailure(e.toString());
    }
  }

  Future<AutocompletePlacesResult> autocompletePlaces(String input) async {
    try {
      final Response<dynamic> response = await dio.get(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json',
        queryParameters: <String, dynamic>{
          'key': _googleApiKey,
          'input': input,
          'types': 'geocode'
        },
      );
      final AutocompletePlacesResponse placesResponse =
          AutocompletePlacesResponse.fromJson(response.data);
      return AutocompletePlacesSuccess(placesResponse.map());
    } on DioError catch (e) {
      _logger.warning(e.toString());
      return AutocompletePlacesFailure(e.toString());
    }
  }

  Future<PlaceDetailsResult> getPlaceDetails(String id) async {
    try {
      final Response<dynamic> response = await dio.get(
        'https://maps.googleapis.com/maps/api/place/details/json',
        queryParameters: <String, dynamic>{
          'key': _googleApiKey,
          'place_id': id,
          'fields': 'place_id,name,geometry'
        },
      );
      final PlaceDetailsResponse placesResponse =
          PlaceDetailsResponse.fromJson(response.data);
      return PlaceDetailsSuccess(placesResponse.map());
    } on DioError catch (e) {
      _logger.warning(e.toString());
      return PlaceDetailsFailure(e.toString());
    }
  }

  Future<SynthesizeTextResult> synthesizeText(String text) async {
    try {
      final String data = jsonEncode(SynthesizeTextRequest(
        input: InputRequest(text),
        voice: VoiceRequest('en-US-Wavenet-J', 'en-US'),
        audioConfig: AudioConfigRequest('MP3'),
      ).toJson());
      final Response<dynamic> response = await dio.post(
        'https://texttospeech.googleapis.com/v1beta1/text:synthesize',
        options: Options(headers: <String, dynamic>{
          'X-Goog-Api-Key': _googleApiKey,
          HttpHeaders.contentTypeHeader: 'application/json',
        }),
        data: data,
      );
      return SynthesizeTextSuccess(response.data['audioContent']);
    } on DioError catch (e) {
      _logger.warning(e.toString());
      return SynthesizeTextFailure(e.toString());
    }
  }
}

const String _googleApiKey = 'FIXME';

@freezed
class SearchPlacesResult with _$SearchPlacesResult {
  factory SearchPlacesResult.success(KtList<GooglePlace> googlePlaces) =
      SearchPlacesSuccess;

  factory SearchPlacesResult.failure(String errorMsg,
      {@Default(true) bool isInternetConnected}) = SearchPlacesFailure;
}

@freezed
class AutocompletePlacesResult with _$AutocompletePlacesResult {
  factory AutocompletePlacesResult.success(
      KtList<GoogleSearchSuggestion> suggestions) = AutocompletePlacesSuccess;

  factory AutocompletePlacesResult.failure(String errorMsg,
      {@Default(true) bool isInternetConnected}) = AutocompletePlacesFailure;
}

@freezed
class PlaceDetailsResult with _$PlaceDetailsResult {
  factory PlaceDetailsResult.success(GooglePlace googlePlace) =
      PlaceDetailsSuccess;

  factory PlaceDetailsResult.failure(String errorMsg,
      {@Default(true) bool isInternetConnected}) = PlaceDetailsFailure;
}

@freezed
class SynthesizeTextResult with _$SynthesizeTextResult {
  factory SynthesizeTextResult.success(String audioContent) =
      SynthesizeTextSuccess;

  factory SynthesizeTextResult.failure(String errorMsg,
      {@Default(true) bool isInternetConnected}) = SynthesizeTextFailure;
}

// ignore: unused_element
final Logger _logger = Logger('GoogleStore');
