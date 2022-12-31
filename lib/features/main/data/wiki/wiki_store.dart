import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:logging/logging.dart';
import 'json/place_summary_response.dart';
import 'json/places_response.dart';
import 'models/wiki_place.dart';

part 'wiki_store.freezed.dart';

class WikiStore {
  WikiStore(this.dio);

  final Dio dio;

  Future<PlacesResult> getPlacesNearby(LocationPoint location) async {
    try {
      final Response<dynamic> response = await dio.get(
        'https://en.wikipedia.org/w/api.php',
        queryParameters: <String, dynamic>{
          'action': 'query',
          'format': 'json',
          'list': 'geosearch',
          'gscoord': '${location.lat}|${location.lng}',
          'gsradius': 10000,
          'gslimit': 20,
          'gsprop': 'globe|type',
        },
      );
      final PlacesResponse placesResponse =
          PlacesResponse.fromJson(response.data);
      return PlacesSuccess(placesResponse.map());
    } on DioError catch (e) {
      _logger.warning(e.toString());
      return PlacesFailure(e.toString());
    }
  }

  Future<GetPlaceSummaryResult> getPlaceSummary(String title) async {
    try {
      final String sTitle = _encodeTitle(title);
      final Response<dynamic> response = await dio.get(
        'https://en.wikipedia.org/api/rest_v1/page/summary/$sTitle',
      );
      final PlaceSummaryResponse summaryResponse =
          PlaceSummaryResponse.fromJson(response.data);
      return GetPlaceSummarySuccess(
        extract: summaryResponse.extract,
        webPage: summaryResponse.page,
      );
    } on DioError catch (e) {
      _logger.warning(e.toString());
      return GetPlaceSummaryFailure(e.toString());
    }
  }

  String _encodeTitle(String title) =>
      Uri.encodeComponent(title.replaceAll(' ', '_'));
}

@freezed
class PlacesResult with _$PlacesResult {
  factory PlacesResult.success(KtList<WikiPlace> places) = PlacesSuccess;

  factory PlacesResult.failure(String errorMsg,
      {@Default(true) bool isInternetConnected}) = PlacesFailure;
}

@freezed
class GetPlaceSummaryResult with _$GetPlaceSummaryResult {
  factory GetPlaceSummaryResult.success({
    required String extract,
    required String webPage,
  }) = GetPlaceSummarySuccess;

  factory GetPlaceSummaryResult.failure(String errorMsg,
      {@Default(true) bool isInternetConnected}) = GetPlaceSummaryFailure;
}

// ignore: unused_element
final Logger _logger = Logger('WikiStore');
