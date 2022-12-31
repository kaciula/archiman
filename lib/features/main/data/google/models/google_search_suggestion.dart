import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_search_suggestion.freezed.dart';

@freezed
class GoogleSearchSuggestion with _$GoogleSearchSuggestion {
  factory GoogleSearchSuggestion({
    required String id,
    required String name,
  }) = _GoogleSearchSuggestion;
}
