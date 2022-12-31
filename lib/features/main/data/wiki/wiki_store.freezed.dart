// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wiki_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlacesResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KtList<WikiPlace> places) success,
    required TResult Function(String errorMsg, bool isInternetConnected)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(KtList<WikiPlace> places)? success,
    TResult? Function(String errorMsg, bool isInternetConnected)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KtList<WikiPlace> places)? success,
    TResult Function(String errorMsg, bool isInternetConnected)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlacesSuccess value) success,
    required TResult Function(PlacesFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlacesSuccess value)? success,
    TResult? Function(PlacesFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlacesSuccess value)? success,
    TResult Function(PlacesFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlacesResultCopyWith<$Res> {
  factory $PlacesResultCopyWith(
          PlacesResult value, $Res Function(PlacesResult) then) =
      _$PlacesResultCopyWithImpl<$Res, PlacesResult>;
}

/// @nodoc
class _$PlacesResultCopyWithImpl<$Res, $Val extends PlacesResult>
    implements $PlacesResultCopyWith<$Res> {
  _$PlacesResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PlacesSuccessCopyWith<$Res> {
  factory _$$PlacesSuccessCopyWith(
          _$PlacesSuccess value, $Res Function(_$PlacesSuccess) then) =
      __$$PlacesSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({KtList<WikiPlace> places});
}

/// @nodoc
class __$$PlacesSuccessCopyWithImpl<$Res>
    extends _$PlacesResultCopyWithImpl<$Res, _$PlacesSuccess>
    implements _$$PlacesSuccessCopyWith<$Res> {
  __$$PlacesSuccessCopyWithImpl(
      _$PlacesSuccess _value, $Res Function(_$PlacesSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? places = null,
  }) {
    return _then(_$PlacesSuccess(
      null == places
          ? _value.places
          : places // ignore: cast_nullable_to_non_nullable
              as KtList<WikiPlace>,
    ));
  }
}

/// @nodoc

class _$PlacesSuccess implements PlacesSuccess {
  _$PlacesSuccess(this.places);

  @override
  final KtList<WikiPlace> places;

  @override
  String toString() {
    return 'PlacesResult.success(places: $places)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlacesSuccess &&
            (identical(other.places, places) || other.places == places));
  }

  @override
  int get hashCode => Object.hash(runtimeType, places);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlacesSuccessCopyWith<_$PlacesSuccess> get copyWith =>
      __$$PlacesSuccessCopyWithImpl<_$PlacesSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KtList<WikiPlace> places) success,
    required TResult Function(String errorMsg, bool isInternetConnected)
        failure,
  }) {
    return success(places);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(KtList<WikiPlace> places)? success,
    TResult? Function(String errorMsg, bool isInternetConnected)? failure,
  }) {
    return success?.call(places);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KtList<WikiPlace> places)? success,
    TResult Function(String errorMsg, bool isInternetConnected)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(places);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlacesSuccess value) success,
    required TResult Function(PlacesFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlacesSuccess value)? success,
    TResult? Function(PlacesFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlacesSuccess value)? success,
    TResult Function(PlacesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class PlacesSuccess implements PlacesResult {
  factory PlacesSuccess(final KtList<WikiPlace> places) = _$PlacesSuccess;

  KtList<WikiPlace> get places;
  @JsonKey(ignore: true)
  _$$PlacesSuccessCopyWith<_$PlacesSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlacesFailureCopyWith<$Res> {
  factory _$$PlacesFailureCopyWith(
          _$PlacesFailure value, $Res Function(_$PlacesFailure) then) =
      __$$PlacesFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMsg, bool isInternetConnected});
}

/// @nodoc
class __$$PlacesFailureCopyWithImpl<$Res>
    extends _$PlacesResultCopyWithImpl<$Res, _$PlacesFailure>
    implements _$$PlacesFailureCopyWith<$Res> {
  __$$PlacesFailureCopyWithImpl(
      _$PlacesFailure _value, $Res Function(_$PlacesFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMsg = null,
    Object? isInternetConnected = null,
  }) {
    return _then(_$PlacesFailure(
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

class _$PlacesFailure implements PlacesFailure {
  _$PlacesFailure(this.errorMsg, {this.isInternetConnected = true});

  @override
  final String errorMsg;
  @override
  @JsonKey()
  final bool isInternetConnected;

  @override
  String toString() {
    return 'PlacesResult.failure(errorMsg: $errorMsg, isInternetConnected: $isInternetConnected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlacesFailure &&
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
  _$$PlacesFailureCopyWith<_$PlacesFailure> get copyWith =>
      __$$PlacesFailureCopyWithImpl<_$PlacesFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KtList<WikiPlace> places) success,
    required TResult Function(String errorMsg, bool isInternetConnected)
        failure,
  }) {
    return failure(errorMsg, isInternetConnected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(KtList<WikiPlace> places)? success,
    TResult? Function(String errorMsg, bool isInternetConnected)? failure,
  }) {
    return failure?.call(errorMsg, isInternetConnected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KtList<WikiPlace> places)? success,
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
    required TResult Function(PlacesSuccess value) success,
    required TResult Function(PlacesFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlacesSuccess value)? success,
    TResult? Function(PlacesFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlacesSuccess value)? success,
    TResult Function(PlacesFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class PlacesFailure implements PlacesResult {
  factory PlacesFailure(final String errorMsg,
      {final bool isInternetConnected}) = _$PlacesFailure;

  String get errorMsg;
  bool get isInternetConnected;
  @JsonKey(ignore: true)
  _$$PlacesFailureCopyWith<_$PlacesFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetPlaceSummaryResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String extract, String webPage) success,
    required TResult Function(String errorMsg, bool isInternetConnected)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String extract, String webPage)? success,
    TResult? Function(String errorMsg, bool isInternetConnected)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String extract, String webPage)? success,
    TResult Function(String errorMsg, bool isInternetConnected)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPlaceSummarySuccess value) success,
    required TResult Function(GetPlaceSummaryFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetPlaceSummarySuccess value)? success,
    TResult? Function(GetPlaceSummaryFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPlaceSummarySuccess value)? success,
    TResult Function(GetPlaceSummaryFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPlaceSummaryResultCopyWith<$Res> {
  factory $GetPlaceSummaryResultCopyWith(GetPlaceSummaryResult value,
          $Res Function(GetPlaceSummaryResult) then) =
      _$GetPlaceSummaryResultCopyWithImpl<$Res, GetPlaceSummaryResult>;
}

/// @nodoc
class _$GetPlaceSummaryResultCopyWithImpl<$Res,
        $Val extends GetPlaceSummaryResult>
    implements $GetPlaceSummaryResultCopyWith<$Res> {
  _$GetPlaceSummaryResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetPlaceSummarySuccessCopyWith<$Res> {
  factory _$$GetPlaceSummarySuccessCopyWith(_$GetPlaceSummarySuccess value,
          $Res Function(_$GetPlaceSummarySuccess) then) =
      __$$GetPlaceSummarySuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({String extract, String webPage});
}

/// @nodoc
class __$$GetPlaceSummarySuccessCopyWithImpl<$Res>
    extends _$GetPlaceSummaryResultCopyWithImpl<$Res, _$GetPlaceSummarySuccess>
    implements _$$GetPlaceSummarySuccessCopyWith<$Res> {
  __$$GetPlaceSummarySuccessCopyWithImpl(_$GetPlaceSummarySuccess _value,
      $Res Function(_$GetPlaceSummarySuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extract = null,
    Object? webPage = null,
  }) {
    return _then(_$GetPlaceSummarySuccess(
      extract: null == extract
          ? _value.extract
          : extract // ignore: cast_nullable_to_non_nullable
              as String,
      webPage: null == webPage
          ? _value.webPage
          : webPage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetPlaceSummarySuccess implements GetPlaceSummarySuccess {
  _$GetPlaceSummarySuccess({required this.extract, required this.webPage});

  @override
  final String extract;
  @override
  final String webPage;

  @override
  String toString() {
    return 'GetPlaceSummaryResult.success(extract: $extract, webPage: $webPage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPlaceSummarySuccess &&
            (identical(other.extract, extract) || other.extract == extract) &&
            (identical(other.webPage, webPage) || other.webPage == webPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, extract, webPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPlaceSummarySuccessCopyWith<_$GetPlaceSummarySuccess> get copyWith =>
      __$$GetPlaceSummarySuccessCopyWithImpl<_$GetPlaceSummarySuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String extract, String webPage) success,
    required TResult Function(String errorMsg, bool isInternetConnected)
        failure,
  }) {
    return success(extract, webPage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String extract, String webPage)? success,
    TResult? Function(String errorMsg, bool isInternetConnected)? failure,
  }) {
    return success?.call(extract, webPage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String extract, String webPage)? success,
    TResult Function(String errorMsg, bool isInternetConnected)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(extract, webPage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetPlaceSummarySuccess value) success,
    required TResult Function(GetPlaceSummaryFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetPlaceSummarySuccess value)? success,
    TResult? Function(GetPlaceSummaryFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPlaceSummarySuccess value)? success,
    TResult Function(GetPlaceSummaryFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GetPlaceSummarySuccess implements GetPlaceSummaryResult {
  factory GetPlaceSummarySuccess(
      {required final String extract,
      required final String webPage}) = _$GetPlaceSummarySuccess;

  String get extract;
  String get webPage;
  @JsonKey(ignore: true)
  _$$GetPlaceSummarySuccessCopyWith<_$GetPlaceSummarySuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetPlaceSummaryFailureCopyWith<$Res> {
  factory _$$GetPlaceSummaryFailureCopyWith(_$GetPlaceSummaryFailure value,
          $Res Function(_$GetPlaceSummaryFailure) then) =
      __$$GetPlaceSummaryFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String errorMsg, bool isInternetConnected});
}

/// @nodoc
class __$$GetPlaceSummaryFailureCopyWithImpl<$Res>
    extends _$GetPlaceSummaryResultCopyWithImpl<$Res, _$GetPlaceSummaryFailure>
    implements _$$GetPlaceSummaryFailureCopyWith<$Res> {
  __$$GetPlaceSummaryFailureCopyWithImpl(_$GetPlaceSummaryFailure _value,
      $Res Function(_$GetPlaceSummaryFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMsg = null,
    Object? isInternetConnected = null,
  }) {
    return _then(_$GetPlaceSummaryFailure(
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

class _$GetPlaceSummaryFailure implements GetPlaceSummaryFailure {
  _$GetPlaceSummaryFailure(this.errorMsg, {this.isInternetConnected = true});

  @override
  final String errorMsg;
  @override
  @JsonKey()
  final bool isInternetConnected;

  @override
  String toString() {
    return 'GetPlaceSummaryResult.failure(errorMsg: $errorMsg, isInternetConnected: $isInternetConnected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPlaceSummaryFailure &&
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
  _$$GetPlaceSummaryFailureCopyWith<_$GetPlaceSummaryFailure> get copyWith =>
      __$$GetPlaceSummaryFailureCopyWithImpl<_$GetPlaceSummaryFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String extract, String webPage) success,
    required TResult Function(String errorMsg, bool isInternetConnected)
        failure,
  }) {
    return failure(errorMsg, isInternetConnected);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String extract, String webPage)? success,
    TResult? Function(String errorMsg, bool isInternetConnected)? failure,
  }) {
    return failure?.call(errorMsg, isInternetConnected);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String extract, String webPage)? success,
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
    required TResult Function(GetPlaceSummarySuccess value) success,
    required TResult Function(GetPlaceSummaryFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetPlaceSummarySuccess value)? success,
    TResult? Function(GetPlaceSummaryFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetPlaceSummarySuccess value)? success,
    TResult Function(GetPlaceSummaryFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class GetPlaceSummaryFailure implements GetPlaceSummaryResult {
  factory GetPlaceSummaryFailure(final String errorMsg,
      {final bool isInternetConnected}) = _$GetPlaceSummaryFailure;

  String get errorMsg;
  bool get isInternetConnected;
  @JsonKey(ignore: true)
  _$$GetPlaceSummaryFailureCopyWith<_$GetPlaceSummaryFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
