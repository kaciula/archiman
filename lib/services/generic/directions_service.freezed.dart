// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'directions_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocationPoint {
  double get lat => throw _privateConstructorUsedError;
  double get lng => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocationPointCopyWith<LocationPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationPointCopyWith<$Res> {
  factory $LocationPointCopyWith(
          LocationPoint value, $Res Function(LocationPoint) then) =
      _$LocationPointCopyWithImpl<$Res, LocationPoint>;
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class _$LocationPointCopyWithImpl<$Res, $Val extends LocationPoint>
    implements $LocationPointCopyWith<$Res> {
  _$LocationPointCopyWithImpl(this._value, this._then);

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
abstract class _$$_LocationPointCopyWith<$Res>
    implements $LocationPointCopyWith<$Res> {
  factory _$$_LocationPointCopyWith(
          _$_LocationPoint value, $Res Function(_$_LocationPoint) then) =
      __$$_LocationPointCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lng});
}

/// @nodoc
class __$$_LocationPointCopyWithImpl<$Res>
    extends _$LocationPointCopyWithImpl<$Res, _$_LocationPoint>
    implements _$$_LocationPointCopyWith<$Res> {
  __$$_LocationPointCopyWithImpl(
      _$_LocationPoint _value, $Res Function(_$_LocationPoint) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lng = null,
  }) {
    return _then(_$_LocationPoint(
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

class _$_LocationPoint implements _LocationPoint {
  _$_LocationPoint({required this.lat, required this.lng});

  @override
  final double lat;
  @override
  final double lng;

  @override
  String toString() {
    return 'LocationPoint(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocationPoint &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocationPointCopyWith<_$_LocationPoint> get copyWith =>
      __$$_LocationPointCopyWithImpl<_$_LocationPoint>(this, _$identity);
}

abstract class _LocationPoint implements LocationPoint {
  factory _LocationPoint(
      {required final double lat,
      required final double lng}) = _$_LocationPoint;

  @override
  double get lat;
  @override
  double get lng;
  @override
  @JsonKey(ignore: true)
  _$$_LocationPointCopyWith<_$_LocationPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DirectionsApp {
  String get appName => throw _privateConstructorUsedError;
  DirectionsAppType get type => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DirectionsAppCopyWith<DirectionsApp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectionsAppCopyWith<$Res> {
  factory $DirectionsAppCopyWith(
          DirectionsApp value, $Res Function(DirectionsApp) then) =
      _$DirectionsAppCopyWithImpl<$Res, DirectionsApp>;
  @useResult
  $Res call({String appName, DirectionsAppType type});
}

/// @nodoc
class _$DirectionsAppCopyWithImpl<$Res, $Val extends DirectionsApp>
    implements $DirectionsAppCopyWith<$Res> {
  _$DirectionsAppCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appName = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DirectionsAppType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DirectionsAppCopyWith<$Res>
    implements $DirectionsAppCopyWith<$Res> {
  factory _$$_DirectionsAppCopyWith(
          _$_DirectionsApp value, $Res Function(_$_DirectionsApp) then) =
      __$$_DirectionsAppCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String appName, DirectionsAppType type});
}

/// @nodoc
class __$$_DirectionsAppCopyWithImpl<$Res>
    extends _$DirectionsAppCopyWithImpl<$Res, _$_DirectionsApp>
    implements _$$_DirectionsAppCopyWith<$Res> {
  __$$_DirectionsAppCopyWithImpl(
      _$_DirectionsApp _value, $Res Function(_$_DirectionsApp) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appName = null,
    Object? type = null,
  }) {
    return _then(_$_DirectionsApp(
      appName: null == appName
          ? _value.appName
          : appName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as DirectionsAppType,
    ));
  }
}

/// @nodoc

class _$_DirectionsApp implements _DirectionsApp {
  _$_DirectionsApp({required this.appName, required this.type});

  @override
  final String appName;
  @override
  final DirectionsAppType type;

  @override
  String toString() {
    return 'DirectionsApp(appName: $appName, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DirectionsApp &&
            (identical(other.appName, appName) || other.appName == appName) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, appName, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DirectionsAppCopyWith<_$_DirectionsApp> get copyWith =>
      __$$_DirectionsAppCopyWithImpl<_$_DirectionsApp>(this, _$identity);
}

abstract class _DirectionsApp implements DirectionsApp {
  factory _DirectionsApp(
      {required final String appName,
      required final DirectionsAppType type}) = _$_DirectionsApp;

  @override
  String get appName;
  @override
  DirectionsAppType get type;
  @override
  @JsonKey(ignore: true)
  _$$_DirectionsAppCopyWith<_$_DirectionsApp> get copyWith =>
      throw _privateConstructorUsedError;
}
