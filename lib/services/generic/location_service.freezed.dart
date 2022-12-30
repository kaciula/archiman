// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CurrentPositionResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LocationPosition position) success,
    required TResult Function() timeout,
    required TResult Function() serviceDisabled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LocationPosition position)? success,
    TResult? Function()? timeout,
    TResult? Function()? serviceDisabled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LocationPosition position)? success,
    TResult Function()? timeout,
    TResult Function()? serviceDisabled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CurrentPositionSuccess value) success,
    required TResult Function(CurrentPositionTimeout value) timeout,
    required TResult Function(CurrentPositionServiceDisabled value)
        serviceDisabled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CurrentPositionSuccess value)? success,
    TResult? Function(CurrentPositionTimeout value)? timeout,
    TResult? Function(CurrentPositionServiceDisabled value)? serviceDisabled,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentPositionSuccess value)? success,
    TResult Function(CurrentPositionTimeout value)? timeout,
    TResult Function(CurrentPositionServiceDisabled value)? serviceDisabled,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentPositionResultCopyWith<$Res> {
  factory $CurrentPositionResultCopyWith(CurrentPositionResult value,
          $Res Function(CurrentPositionResult) then) =
      _$CurrentPositionResultCopyWithImpl<$Res, CurrentPositionResult>;
}

/// @nodoc
class _$CurrentPositionResultCopyWithImpl<$Res,
        $Val extends CurrentPositionResult>
    implements $CurrentPositionResultCopyWith<$Res> {
  _$CurrentPositionResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CurrentPositionSuccessCopyWith<$Res> {
  factory _$$CurrentPositionSuccessCopyWith(_$CurrentPositionSuccess value,
          $Res Function(_$CurrentPositionSuccess) then) =
      __$$CurrentPositionSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({LocationPosition position});

  $LocationPositionCopyWith<$Res> get position;
}

/// @nodoc
class __$$CurrentPositionSuccessCopyWithImpl<$Res>
    extends _$CurrentPositionResultCopyWithImpl<$Res, _$CurrentPositionSuccess>
    implements _$$CurrentPositionSuccessCopyWith<$Res> {
  __$$CurrentPositionSuccessCopyWithImpl(_$CurrentPositionSuccess _value,
      $Res Function(_$CurrentPositionSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
  }) {
    return _then(_$CurrentPositionSuccess(
      null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as LocationPosition,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationPositionCopyWith<$Res> get position {
    return $LocationPositionCopyWith<$Res>(_value.position, (value) {
      return _then(_value.copyWith(position: value));
    });
  }
}

/// @nodoc

class _$CurrentPositionSuccess implements CurrentPositionSuccess {
  _$CurrentPositionSuccess(this.position);

  @override
  final LocationPosition position;

  @override
  String toString() {
    return 'CurrentPositionResult.success(position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentPositionSuccess &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentPositionSuccessCopyWith<_$CurrentPositionSuccess> get copyWith =>
      __$$CurrentPositionSuccessCopyWithImpl<_$CurrentPositionSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LocationPosition position) success,
    required TResult Function() timeout,
    required TResult Function() serviceDisabled,
  }) {
    return success(position);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LocationPosition position)? success,
    TResult? Function()? timeout,
    TResult? Function()? serviceDisabled,
  }) {
    return success?.call(position);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LocationPosition position)? success,
    TResult Function()? timeout,
    TResult Function()? serviceDisabled,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(position);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CurrentPositionSuccess value) success,
    required TResult Function(CurrentPositionTimeout value) timeout,
    required TResult Function(CurrentPositionServiceDisabled value)
        serviceDisabled,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CurrentPositionSuccess value)? success,
    TResult? Function(CurrentPositionTimeout value)? timeout,
    TResult? Function(CurrentPositionServiceDisabled value)? serviceDisabled,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentPositionSuccess value)? success,
    TResult Function(CurrentPositionTimeout value)? timeout,
    TResult Function(CurrentPositionServiceDisabled value)? serviceDisabled,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class CurrentPositionSuccess implements CurrentPositionResult {
  factory CurrentPositionSuccess(final LocationPosition position) =
      _$CurrentPositionSuccess;

  LocationPosition get position;
  @JsonKey(ignore: true)
  _$$CurrentPositionSuccessCopyWith<_$CurrentPositionSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CurrentPositionTimeoutCopyWith<$Res> {
  factory _$$CurrentPositionTimeoutCopyWith(_$CurrentPositionTimeout value,
          $Res Function(_$CurrentPositionTimeout) then) =
      __$$CurrentPositionTimeoutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CurrentPositionTimeoutCopyWithImpl<$Res>
    extends _$CurrentPositionResultCopyWithImpl<$Res, _$CurrentPositionTimeout>
    implements _$$CurrentPositionTimeoutCopyWith<$Res> {
  __$$CurrentPositionTimeoutCopyWithImpl(_$CurrentPositionTimeout _value,
      $Res Function(_$CurrentPositionTimeout) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CurrentPositionTimeout implements CurrentPositionTimeout {
  _$CurrentPositionTimeout();

  @override
  String toString() {
    return 'CurrentPositionResult.timeout()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CurrentPositionTimeout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LocationPosition position) success,
    required TResult Function() timeout,
    required TResult Function() serviceDisabled,
  }) {
    return timeout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LocationPosition position)? success,
    TResult? Function()? timeout,
    TResult? Function()? serviceDisabled,
  }) {
    return timeout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LocationPosition position)? success,
    TResult Function()? timeout,
    TResult Function()? serviceDisabled,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CurrentPositionSuccess value) success,
    required TResult Function(CurrentPositionTimeout value) timeout,
    required TResult Function(CurrentPositionServiceDisabled value)
        serviceDisabled,
  }) {
    return timeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CurrentPositionSuccess value)? success,
    TResult? Function(CurrentPositionTimeout value)? timeout,
    TResult? Function(CurrentPositionServiceDisabled value)? serviceDisabled,
  }) {
    return timeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentPositionSuccess value)? success,
    TResult Function(CurrentPositionTimeout value)? timeout,
    TResult Function(CurrentPositionServiceDisabled value)? serviceDisabled,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(this);
    }
    return orElse();
  }
}

abstract class CurrentPositionTimeout implements CurrentPositionResult {
  factory CurrentPositionTimeout() = _$CurrentPositionTimeout;
}

/// @nodoc
abstract class _$$CurrentPositionServiceDisabledCopyWith<$Res> {
  factory _$$CurrentPositionServiceDisabledCopyWith(
          _$CurrentPositionServiceDisabled value,
          $Res Function(_$CurrentPositionServiceDisabled) then) =
      __$$CurrentPositionServiceDisabledCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CurrentPositionServiceDisabledCopyWithImpl<$Res>
    extends _$CurrentPositionResultCopyWithImpl<$Res,
        _$CurrentPositionServiceDisabled>
    implements _$$CurrentPositionServiceDisabledCopyWith<$Res> {
  __$$CurrentPositionServiceDisabledCopyWithImpl(
      _$CurrentPositionServiceDisabled _value,
      $Res Function(_$CurrentPositionServiceDisabled) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CurrentPositionServiceDisabled
    implements CurrentPositionServiceDisabled {
  _$CurrentPositionServiceDisabled();

  @override
  String toString() {
    return 'CurrentPositionResult.serviceDisabled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentPositionServiceDisabled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LocationPosition position) success,
    required TResult Function() timeout,
    required TResult Function() serviceDisabled,
  }) {
    return serviceDisabled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LocationPosition position)? success,
    TResult? Function()? timeout,
    TResult? Function()? serviceDisabled,
  }) {
    return serviceDisabled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LocationPosition position)? success,
    TResult Function()? timeout,
    TResult Function()? serviceDisabled,
    required TResult orElse(),
  }) {
    if (serviceDisabled != null) {
      return serviceDisabled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CurrentPositionSuccess value) success,
    required TResult Function(CurrentPositionTimeout value) timeout,
    required TResult Function(CurrentPositionServiceDisabled value)
        serviceDisabled,
  }) {
    return serviceDisabled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CurrentPositionSuccess value)? success,
    TResult? Function(CurrentPositionTimeout value)? timeout,
    TResult? Function(CurrentPositionServiceDisabled value)? serviceDisabled,
  }) {
    return serviceDisabled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentPositionSuccess value)? success,
    TResult Function(CurrentPositionTimeout value)? timeout,
    TResult Function(CurrentPositionServiceDisabled value)? serviceDisabled,
    required TResult orElse(),
  }) {
    if (serviceDisabled != null) {
      return serviceDisabled(this);
    }
    return orElse();
  }
}

abstract class CurrentPositionServiceDisabled implements CurrentPositionResult {
  factory CurrentPositionServiceDisabled() = _$CurrentPositionServiceDisabled;
}

/// @nodoc
mixin _$LocationPosition {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocationPositionCopyWith<LocationPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationPositionCopyWith<$Res> {
  factory $LocationPositionCopyWith(
          LocationPosition value, $Res Function(LocationPosition) then) =
      _$LocationPositionCopyWithImpl<$Res, LocationPosition>;
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class _$LocationPositionCopyWithImpl<$Res, $Val extends LocationPosition>
    implements $LocationPositionCopyWith<$Res> {
  _$LocationPositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocationPositionCopyWith<$Res>
    implements $LocationPositionCopyWith<$Res> {
  factory _$$_LocationPositionCopyWith(
          _$_LocationPosition value, $Res Function(_$_LocationPosition) then) =
      __$$_LocationPositionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class __$$_LocationPositionCopyWithImpl<$Res>
    extends _$LocationPositionCopyWithImpl<$Res, _$_LocationPosition>
    implements _$$_LocationPositionCopyWith<$Res> {
  __$$_LocationPositionCopyWithImpl(
      _$_LocationPosition _value, $Res Function(_$_LocationPosition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_$_LocationPosition(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lng: null == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_LocationPosition implements _LocationPosition {
  _$_LocationPosition({required this.lat, required this.lng});

  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'LocationPosition(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocationPosition &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocationPositionCopyWith<_$_LocationPosition> get copyWith =>
      __$$_LocationPositionCopyWithImpl<_$_LocationPosition>(this, _$identity);
}

abstract class _LocationPosition implements LocationPosition {
  factory _LocationPosition(
      {required final double lat,
      required final double lng}) = _$_LocationPosition;

  @override
  double get lat;
  @override
  double get lng;
  @override
  @JsonKey(ignore: true)
  _$$_LocationPositionCopyWith<_$_LocationPosition> get copyWith =>
      throw _privateConstructorUsedError;
}
