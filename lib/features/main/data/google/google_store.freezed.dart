// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchPlacesResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KtList<GooglePlace> googlePlaces) success,
    required TResult Function(String errorMsg, bool isInternetConnected)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(KtList<GooglePlace> googlePlaces)? success,
    TResult? Function(String errorMsg, bool isInternetConnected)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KtList<GooglePlace> googlePlaces)? success,
    TResult Function(String errorMsg, bool isInternetConnected)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchPlacesSuccess value) success,
    required TResult Function(SearchPlacesFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchPlacesSuccess value)? success,
    TResult? Function(SearchPlacesFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchPlacesSuccess value)? success,
    TResult Function(SearchPlacesFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchPlacesResultCopyWith<$Res> {
  factory $SearchPlacesResultCopyWith(
          SearchPlacesResult value, $Res Function(SearchPlacesResult) then) =
      _$SearchPlacesResultCopyWithImpl<$Res, SearchPlacesResult>;
}

/// @nodoc
class _$SearchPlacesResultCopyWithImpl<$Res, $Val extends SearchPlacesResult>
    implements $SearchPlacesResultCopyWith<$Res> {
  _$SearchPlacesResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SearchPlacesSuccessCopyWith<$Res> {
  factory _$$SearchPlacesSuccessCopyWith(_$SearchPlacesSuccess value,
          $Res Function(_$SearchPlacesSuccess) then) =
      __$$SearchPlacesSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({KtList<GooglePlace> googlePlaces});
}

/// @nodoc
class __$$SearchPlacesSuccessCopyWithImpl<$Res>
    extends _$SearchPlacesResultCopyWithImpl<$Res, _$SearchPlacesSuccess>
    implements _$$SearchPlacesSuccessCopyWith<$Res> {
  __$$SearchPlacesSuccessCopyWithImpl(
      _$SearchPlacesSuccess _value, $Res Function(_$SearchPlacesSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? googlePlaces = null,
  }) {
    return _then(_$SearchPlacesSuccess(
      null == googlePlaces
          ? _value.googlePlaces
          : googlePlaces // ignore: cast_nullable_to_non_nullable
              as KtList<GooglePlace>,
    ));
  }
}

/// @nodoc

class _$SearchPlacesSuccess implements SearchPlacesSuccess {
  _$SearchPlacesSuccess(this.googlePlaces);

  @override
  final KtList<GooglePlace> googlePlaces;

  @override
  String toString() {
    return 'SearchPlacesResult.success(googlePlaces: $googlePlaces)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchPlacesSuccess &&
            (identical(other.googlePlaces, googlePlaces) ||
                other.googlePlaces == googlePlaces));
  }

  @override
  int get hashCode => Object.hash(runtimeType, googlePlaces);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchPlacesSuccessCopyWith<_$SearchPlacesSuccess> get copyWith =>
      __$$SearchPlacesSuccessCopyWithImpl<_$SearchPlacesSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KtList<GooglePlace> googlePlaces) success,
    required TResult Function(String errorMsg, bool isInternetConnected)
        failure,
  }) {
    return success(googlePlaces);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(KtList<GooglePlace> googlePlaces)? success,
    TResult? Function(String errorMsg, bool isInternetConnected)? failure,
  }) {
    return success?.call(googlePlaces);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KtList<GooglePlace> googlePlaces)? success,
    TResult Function(String errorMsg, bool isInternetConnected)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(googlePlaces);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchPlacesSuccess value) success,
    required TResult Function(SearchPlacesFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchPlacesSuccess value)? success,
    TResult? Function(SearchPlacesFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchPlacesSuccess value)? success,
    TResult Function(SearchPlacesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SearchPlacesSuccess implements SearchPlacesResult {
  factory SearchPlacesSuccess(final KtList<GooglePlace> googlePlaces) =
      _$SearchPlacesSuccess;

  KtList<GooglePlace> get googlePlaces;
  @JsonKey(ignore: true)
  _$$SearchPlacesSuccessCopyWith<_$SearchPlacesSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchPlacesFailureCopyWith<$Res> {
  factory _$$SearchPlacesFailureCopyWith(_$SearchPlacesFailure value,
          $Res Function(_$SearchPlacesFailure) then) =
      __$$SearchPlacesFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMsg, bool isInternetConnected});
}

/// @nodoc
class __$$SearchPlacesFailureCopyWithImpl<$Res>
    extends _$SearchPlacesResultCopyWithImpl<$Res, _$SearchPlacesFailure>
    implements _$$SearchPlacesFailureCopyWith<$Res> {
  __$$SearchPlacesFailureCopyWithImpl(
      _$SearchPlacesFailure _value, $Res Function(_$SearchPlacesFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMsg = null,
    Object? isInternetConnected = null,
  }) {
    return _then(_$SearchPlacesFailure(
      null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      isInternetConnected: null == isInternetConnected
          ? _value.isInternetConnected
          : isInternetConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SearchPlacesFailure implements SearchPlacesFailure {
  _$SearchPlacesFailure(this.errorMsg, {this.isInternetConnected = true});

  @override
  final String errorMsg;
  @override
  @JsonKey()
  final bool isInternetConnected;

  @override
  String toString() {
    return 'SearchPlacesResult.failure(errorMsg: $errorMsg, isInternetConnected: $isInternetConnected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchPlacesFailure &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg) &&
            (identical(other.isInternetConnected, isInternetConnected) ||
                other.isInternetConnected == isInternetConnected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMsg, isInternetConnected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchPlacesFailureCopyWith<_$SearchPlacesFailure> get copyWith =>
      __$$SearchPlacesFailureCopyWithImpl<_$SearchPlacesFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KtList<GooglePlace> googlePlaces) success,
    required TResult Function(String errorMsg, bool isInternetConnected)
        failure,
  }) {
    return failure(errorMsg, isInternetConnected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(KtList<GooglePlace> googlePlaces)? success,
    TResult? Function(String errorMsg, bool isInternetConnected)? failure,
  }) {
    return failure?.call(errorMsg, isInternetConnected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KtList<GooglePlace> googlePlaces)? success,
    TResult Function(String errorMsg, bool isInternetConnected)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(errorMsg, isInternetConnected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchPlacesSuccess value) success,
    required TResult Function(SearchPlacesFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SearchPlacesSuccess value)? success,
    TResult? Function(SearchPlacesFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchPlacesSuccess value)? success,
    TResult Function(SearchPlacesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class SearchPlacesFailure implements SearchPlacesResult {
  factory SearchPlacesFailure(final String errorMsg,
      {final bool isInternetConnected}) = _$SearchPlacesFailure;

  String get errorMsg;
  bool get isInternetConnected;
  @JsonKey(ignore: true)
  _$$SearchPlacesFailureCopyWith<_$SearchPlacesFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AutocompletePlacesResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KtList<GoogleSearchSuggestion> suggestions)
        success,
    required TResult Function(String errorMsg, bool isInternetConnected)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(KtList<GoogleSearchSuggestion> suggestions)? success,
    TResult? Function(String errorMsg, bool isInternetConnected)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KtList<GoogleSearchSuggestion> suggestions)? success,
    TResult Function(String errorMsg, bool isInternetConnected)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AutocompletePlacesSuccess value) success,
    required TResult Function(AutocompletePlacesFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AutocompletePlacesSuccess value)? success,
    TResult? Function(AutocompletePlacesFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AutocompletePlacesSuccess value)? success,
    TResult Function(AutocompletePlacesFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutocompletePlacesResultCopyWith<$Res> {
  factory $AutocompletePlacesResultCopyWith(AutocompletePlacesResult value,
          $Res Function(AutocompletePlacesResult) then) =
      _$AutocompletePlacesResultCopyWithImpl<$Res, AutocompletePlacesResult>;
}

/// @nodoc
class _$AutocompletePlacesResultCopyWithImpl<$Res,
        $Val extends AutocompletePlacesResult>
    implements $AutocompletePlacesResultCopyWith<$Res> {
  _$AutocompletePlacesResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AutocompletePlacesSuccessCopyWith<$Res> {
  factory _$$AutocompletePlacesSuccessCopyWith(
          _$AutocompletePlacesSuccess value,
          $Res Function(_$AutocompletePlacesSuccess) then) =
      __$$AutocompletePlacesSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({KtList<GoogleSearchSuggestion> suggestions});
}

/// @nodoc
class __$$AutocompletePlacesSuccessCopyWithImpl<$Res>
    extends _$AutocompletePlacesResultCopyWithImpl<$Res,
        _$AutocompletePlacesSuccess>
    implements _$$AutocompletePlacesSuccessCopyWith<$Res> {
  __$$AutocompletePlacesSuccessCopyWithImpl(_$AutocompletePlacesSuccess _value,
      $Res Function(_$AutocompletePlacesSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? suggestions = null,
  }) {
    return _then(_$AutocompletePlacesSuccess(
      null == suggestions
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as KtList<GoogleSearchSuggestion>,
    ));
  }
}

/// @nodoc

class _$AutocompletePlacesSuccess implements AutocompletePlacesSuccess {
  _$AutocompletePlacesSuccess(this.suggestions);

  @override
  final KtList<GoogleSearchSuggestion> suggestions;

  @override
  String toString() {
    return 'AutocompletePlacesResult.success(suggestions: $suggestions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutocompletePlacesSuccess &&
            (identical(other.suggestions, suggestions) ||
                other.suggestions == suggestions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, suggestions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AutocompletePlacesSuccessCopyWith<_$AutocompletePlacesSuccess>
      get copyWith => __$$AutocompletePlacesSuccessCopyWithImpl<
          _$AutocompletePlacesSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KtList<GoogleSearchSuggestion> suggestions)
        success,
    required TResult Function(String errorMsg, bool isInternetConnected)
        failure,
  }) {
    return success(suggestions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(KtList<GoogleSearchSuggestion> suggestions)? success,
    TResult? Function(String errorMsg, bool isInternetConnected)? failure,
  }) {
    return success?.call(suggestions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KtList<GoogleSearchSuggestion> suggestions)? success,
    TResult Function(String errorMsg, bool isInternetConnected)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(suggestions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AutocompletePlacesSuccess value) success,
    required TResult Function(AutocompletePlacesFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AutocompletePlacesSuccess value)? success,
    TResult? Function(AutocompletePlacesFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AutocompletePlacesSuccess value)? success,
    TResult Function(AutocompletePlacesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class AutocompletePlacesSuccess implements AutocompletePlacesResult {
  factory AutocompletePlacesSuccess(
          final KtList<GoogleSearchSuggestion> suggestions) =
      _$AutocompletePlacesSuccess;

  KtList<GoogleSearchSuggestion> get suggestions;
  @JsonKey(ignore: true)
  _$$AutocompletePlacesSuccessCopyWith<_$AutocompletePlacesSuccess>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AutocompletePlacesFailureCopyWith<$Res> {
  factory _$$AutocompletePlacesFailureCopyWith(
          _$AutocompletePlacesFailure value,
          $Res Function(_$AutocompletePlacesFailure) then) =
      __$$AutocompletePlacesFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMsg, bool isInternetConnected});
}

/// @nodoc
class __$$AutocompletePlacesFailureCopyWithImpl<$Res>
    extends _$AutocompletePlacesResultCopyWithImpl<$Res,
        _$AutocompletePlacesFailure>
    implements _$$AutocompletePlacesFailureCopyWith<$Res> {
  __$$AutocompletePlacesFailureCopyWithImpl(_$AutocompletePlacesFailure _value,
      $Res Function(_$AutocompletePlacesFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMsg = null,
    Object? isInternetConnected = null,
  }) {
    return _then(_$AutocompletePlacesFailure(
      null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      isInternetConnected: null == isInternetConnected
          ? _value.isInternetConnected
          : isInternetConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AutocompletePlacesFailure implements AutocompletePlacesFailure {
  _$AutocompletePlacesFailure(this.errorMsg, {this.isInternetConnected = true});

  @override
  final String errorMsg;
  @override
  @JsonKey()
  final bool isInternetConnected;

  @override
  String toString() {
    return 'AutocompletePlacesResult.failure(errorMsg: $errorMsg, isInternetConnected: $isInternetConnected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutocompletePlacesFailure &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg) &&
            (identical(other.isInternetConnected, isInternetConnected) ||
                other.isInternetConnected == isInternetConnected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMsg, isInternetConnected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AutocompletePlacesFailureCopyWith<_$AutocompletePlacesFailure>
      get copyWith => __$$AutocompletePlacesFailureCopyWithImpl<
          _$AutocompletePlacesFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KtList<GoogleSearchSuggestion> suggestions)
        success,
    required TResult Function(String errorMsg, bool isInternetConnected)
        failure,
  }) {
    return failure(errorMsg, isInternetConnected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(KtList<GoogleSearchSuggestion> suggestions)? success,
    TResult? Function(String errorMsg, bool isInternetConnected)? failure,
  }) {
    return failure?.call(errorMsg, isInternetConnected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KtList<GoogleSearchSuggestion> suggestions)? success,
    TResult Function(String errorMsg, bool isInternetConnected)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(errorMsg, isInternetConnected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AutocompletePlacesSuccess value) success,
    required TResult Function(AutocompletePlacesFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AutocompletePlacesSuccess value)? success,
    TResult? Function(AutocompletePlacesFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AutocompletePlacesSuccess value)? success,
    TResult Function(AutocompletePlacesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class AutocompletePlacesFailure implements AutocompletePlacesResult {
  factory AutocompletePlacesFailure(final String errorMsg,
      {final bool isInternetConnected}) = _$AutocompletePlacesFailure;

  String get errorMsg;
  bool get isInternetConnected;
  @JsonKey(ignore: true)
  _$$AutocompletePlacesFailureCopyWith<_$AutocompletePlacesFailure>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PlaceDetailsResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GooglePlace googlePlace) success,
    required TResult Function(String errorMsg, bool isInternetConnected)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GooglePlace googlePlace)? success,
    TResult? Function(String errorMsg, bool isInternetConnected)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GooglePlace googlePlace)? success,
    TResult Function(String errorMsg, bool isInternetConnected)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlaceDetailsSuccess value) success,
    required TResult Function(PlaceDetailsFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlaceDetailsSuccess value)? success,
    TResult? Function(PlaceDetailsFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceDetailsSuccess value)? success,
    TResult Function(PlaceDetailsFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceDetailsResultCopyWith<$Res> {
  factory $PlaceDetailsResultCopyWith(
          PlaceDetailsResult value, $Res Function(PlaceDetailsResult) then) =
      _$PlaceDetailsResultCopyWithImpl<$Res, PlaceDetailsResult>;
}

/// @nodoc
class _$PlaceDetailsResultCopyWithImpl<$Res, $Val extends PlaceDetailsResult>
    implements $PlaceDetailsResultCopyWith<$Res> {
  _$PlaceDetailsResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PlaceDetailsSuccessCopyWith<$Res> {
  factory _$$PlaceDetailsSuccessCopyWith(_$PlaceDetailsSuccess value,
          $Res Function(_$PlaceDetailsSuccess) then) =
      __$$PlaceDetailsSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({GooglePlace googlePlace});

  $GooglePlaceCopyWith<$Res> get googlePlace;
}

/// @nodoc
class __$$PlaceDetailsSuccessCopyWithImpl<$Res>
    extends _$PlaceDetailsResultCopyWithImpl<$Res, _$PlaceDetailsSuccess>
    implements _$$PlaceDetailsSuccessCopyWith<$Res> {
  __$$PlaceDetailsSuccessCopyWithImpl(
      _$PlaceDetailsSuccess _value, $Res Function(_$PlaceDetailsSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? googlePlace = null,
  }) {
    return _then(_$PlaceDetailsSuccess(
      null == googlePlace
          ? _value.googlePlace
          : googlePlace // ignore: cast_nullable_to_non_nullable
              as GooglePlace,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $GooglePlaceCopyWith<$Res> get googlePlace {
    return $GooglePlaceCopyWith<$Res>(_value.googlePlace, (value) {
      return _then(_value.copyWith(googlePlace: value));
    });
  }
}

/// @nodoc

class _$PlaceDetailsSuccess implements PlaceDetailsSuccess {
  _$PlaceDetailsSuccess(this.googlePlace);

  @override
  final GooglePlace googlePlace;

  @override
  String toString() {
    return 'PlaceDetailsResult.success(googlePlace: $googlePlace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceDetailsSuccess &&
            (identical(other.googlePlace, googlePlace) ||
                other.googlePlace == googlePlace));
  }

  @override
  int get hashCode => Object.hash(runtimeType, googlePlace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceDetailsSuccessCopyWith<_$PlaceDetailsSuccess> get copyWith =>
      __$$PlaceDetailsSuccessCopyWithImpl<_$PlaceDetailsSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GooglePlace googlePlace) success,
    required TResult Function(String errorMsg, bool isInternetConnected)
        failure,
  }) {
    return success(googlePlace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GooglePlace googlePlace)? success,
    TResult? Function(String errorMsg, bool isInternetConnected)? failure,
  }) {
    return success?.call(googlePlace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GooglePlace googlePlace)? success,
    TResult Function(String errorMsg, bool isInternetConnected)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(googlePlace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlaceDetailsSuccess value) success,
    required TResult Function(PlaceDetailsFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlaceDetailsSuccess value)? success,
    TResult? Function(PlaceDetailsFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceDetailsSuccess value)? success,
    TResult Function(PlaceDetailsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class PlaceDetailsSuccess implements PlaceDetailsResult {
  factory PlaceDetailsSuccess(final GooglePlace googlePlace) =
      _$PlaceDetailsSuccess;

  GooglePlace get googlePlace;
  @JsonKey(ignore: true)
  _$$PlaceDetailsSuccessCopyWith<_$PlaceDetailsSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlaceDetailsFailureCopyWith<$Res> {
  factory _$$PlaceDetailsFailureCopyWith(_$PlaceDetailsFailure value,
          $Res Function(_$PlaceDetailsFailure) then) =
      __$$PlaceDetailsFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMsg, bool isInternetConnected});
}

/// @nodoc
class __$$PlaceDetailsFailureCopyWithImpl<$Res>
    extends _$PlaceDetailsResultCopyWithImpl<$Res, _$PlaceDetailsFailure>
    implements _$$PlaceDetailsFailureCopyWith<$Res> {
  __$$PlaceDetailsFailureCopyWithImpl(
      _$PlaceDetailsFailure _value, $Res Function(_$PlaceDetailsFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMsg = null,
    Object? isInternetConnected = null,
  }) {
    return _then(_$PlaceDetailsFailure(
      null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      isInternetConnected: null == isInternetConnected
          ? _value.isInternetConnected
          : isInternetConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PlaceDetailsFailure implements PlaceDetailsFailure {
  _$PlaceDetailsFailure(this.errorMsg, {this.isInternetConnected = true});

  @override
  final String errorMsg;
  @override
  @JsonKey()
  final bool isInternetConnected;

  @override
  String toString() {
    return 'PlaceDetailsResult.failure(errorMsg: $errorMsg, isInternetConnected: $isInternetConnected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaceDetailsFailure &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg) &&
            (identical(other.isInternetConnected, isInternetConnected) ||
                other.isInternetConnected == isInternetConnected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMsg, isInternetConnected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceDetailsFailureCopyWith<_$PlaceDetailsFailure> get copyWith =>
      __$$PlaceDetailsFailureCopyWithImpl<_$PlaceDetailsFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GooglePlace googlePlace) success,
    required TResult Function(String errorMsg, bool isInternetConnected)
        failure,
  }) {
    return failure(errorMsg, isInternetConnected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GooglePlace googlePlace)? success,
    TResult? Function(String errorMsg, bool isInternetConnected)? failure,
  }) {
    return failure?.call(errorMsg, isInternetConnected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GooglePlace googlePlace)? success,
    TResult Function(String errorMsg, bool isInternetConnected)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(errorMsg, isInternetConnected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlaceDetailsSuccess value) success,
    required TResult Function(PlaceDetailsFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlaceDetailsSuccess value)? success,
    TResult? Function(PlaceDetailsFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlaceDetailsSuccess value)? success,
    TResult Function(PlaceDetailsFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class PlaceDetailsFailure implements PlaceDetailsResult {
  factory PlaceDetailsFailure(final String errorMsg,
      {final bool isInternetConnected}) = _$PlaceDetailsFailure;

  String get errorMsg;
  bool get isInternetConnected;
  @JsonKey(ignore: true)
  _$$PlaceDetailsFailureCopyWith<_$PlaceDetailsFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SynthesizeTextResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String audioContent) success,
    required TResult Function(String errorMsg, bool isInternetConnected)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String audioContent)? success,
    TResult? Function(String errorMsg, bool isInternetConnected)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String audioContent)? success,
    TResult Function(String errorMsg, bool isInternetConnected)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SynthesizeTextSuccess value) success,
    required TResult Function(SynthesizeTextFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SynthesizeTextSuccess value)? success,
    TResult? Function(SynthesizeTextFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SynthesizeTextSuccess value)? success,
    TResult Function(SynthesizeTextFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SynthesizeTextResultCopyWith<$Res> {
  factory $SynthesizeTextResultCopyWith(SynthesizeTextResult value,
          $Res Function(SynthesizeTextResult) then) =
      _$SynthesizeTextResultCopyWithImpl<$Res, SynthesizeTextResult>;
}

/// @nodoc
class _$SynthesizeTextResultCopyWithImpl<$Res,
        $Val extends SynthesizeTextResult>
    implements $SynthesizeTextResultCopyWith<$Res> {
  _$SynthesizeTextResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SynthesizeTextSuccessCopyWith<$Res> {
  factory _$$SynthesizeTextSuccessCopyWith(_$SynthesizeTextSuccess value,
          $Res Function(_$SynthesizeTextSuccess) then) =
      __$$SynthesizeTextSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({String audioContent});
}

/// @nodoc
class __$$SynthesizeTextSuccessCopyWithImpl<$Res>
    extends _$SynthesizeTextResultCopyWithImpl<$Res, _$SynthesizeTextSuccess>
    implements _$$SynthesizeTextSuccessCopyWith<$Res> {
  __$$SynthesizeTextSuccessCopyWithImpl(_$SynthesizeTextSuccess _value,
      $Res Function(_$SynthesizeTextSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioContent = null,
  }) {
    return _then(_$SynthesizeTextSuccess(
      null == audioContent
          ? _value.audioContent
          : audioContent // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SynthesizeTextSuccess implements SynthesizeTextSuccess {
  _$SynthesizeTextSuccess(this.audioContent);

  @override
  final String audioContent;

  @override
  String toString() {
    return 'SynthesizeTextResult.success(audioContent: $audioContent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SynthesizeTextSuccess &&
            (identical(other.audioContent, audioContent) ||
                other.audioContent == audioContent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, audioContent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SynthesizeTextSuccessCopyWith<_$SynthesizeTextSuccess> get copyWith =>
      __$$SynthesizeTextSuccessCopyWithImpl<_$SynthesizeTextSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String audioContent) success,
    required TResult Function(String errorMsg, bool isInternetConnected)
        failure,
  }) {
    return success(audioContent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String audioContent)? success,
    TResult? Function(String errorMsg, bool isInternetConnected)? failure,
  }) {
    return success?.call(audioContent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String audioContent)? success,
    TResult Function(String errorMsg, bool isInternetConnected)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(audioContent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SynthesizeTextSuccess value) success,
    required TResult Function(SynthesizeTextFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SynthesizeTextSuccess value)? success,
    TResult? Function(SynthesizeTextFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SynthesizeTextSuccess value)? success,
    TResult Function(SynthesizeTextFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SynthesizeTextSuccess implements SynthesizeTextResult {
  factory SynthesizeTextSuccess(final String audioContent) =
      _$SynthesizeTextSuccess;

  String get audioContent;
  @JsonKey(ignore: true)
  _$$SynthesizeTextSuccessCopyWith<_$SynthesizeTextSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SynthesizeTextFailureCopyWith<$Res> {
  factory _$$SynthesizeTextFailureCopyWith(_$SynthesizeTextFailure value,
          $Res Function(_$SynthesizeTextFailure) then) =
      __$$SynthesizeTextFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMsg, bool isInternetConnected});
}

/// @nodoc
class __$$SynthesizeTextFailureCopyWithImpl<$Res>
    extends _$SynthesizeTextResultCopyWithImpl<$Res, _$SynthesizeTextFailure>
    implements _$$SynthesizeTextFailureCopyWith<$Res> {
  __$$SynthesizeTextFailureCopyWithImpl(_$SynthesizeTextFailure _value,
      $Res Function(_$SynthesizeTextFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMsg = null,
    Object? isInternetConnected = null,
  }) {
    return _then(_$SynthesizeTextFailure(
      null == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String,
      isInternetConnected: null == isInternetConnected
          ? _value.isInternetConnected
          : isInternetConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SynthesizeTextFailure implements SynthesizeTextFailure {
  _$SynthesizeTextFailure(this.errorMsg, {this.isInternetConnected = true});

  @override
  final String errorMsg;
  @override
  @JsonKey()
  final bool isInternetConnected;

  @override
  String toString() {
    return 'SynthesizeTextResult.failure(errorMsg: $errorMsg, isInternetConnected: $isInternetConnected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SynthesizeTextFailure &&
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg) &&
            (identical(other.isInternetConnected, isInternetConnected) ||
                other.isInternetConnected == isInternetConnected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMsg, isInternetConnected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SynthesizeTextFailureCopyWith<_$SynthesizeTextFailure> get copyWith =>
      __$$SynthesizeTextFailureCopyWithImpl<_$SynthesizeTextFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String audioContent) success,
    required TResult Function(String errorMsg, bool isInternetConnected)
        failure,
  }) {
    return failure(errorMsg, isInternetConnected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String audioContent)? success,
    TResult? Function(String errorMsg, bool isInternetConnected)? failure,
  }) {
    return failure?.call(errorMsg, isInternetConnected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String audioContent)? success,
    TResult Function(String errorMsg, bool isInternetConnected)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(errorMsg, isInternetConnected);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SynthesizeTextSuccess value) success,
    required TResult Function(SynthesizeTextFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SynthesizeTextSuccess value)? success,
    TResult? Function(SynthesizeTextFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SynthesizeTextSuccess value)? success,
    TResult Function(SynthesizeTextFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class SynthesizeTextFailure implements SynthesizeTextResult {
  factory SynthesizeTextFailure(final String errorMsg,
      {final bool isInternetConnected}) = _$SynthesizeTextFailure;

  String get errorMsg;
  bool get isInternetConnected;
  @JsonKey(ignore: true)
  _$$SynthesizeTextFailureCopyWith<_$SynthesizeTextFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
