// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GooglePlace {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  LocationPoint get location => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GooglePlaceCopyWith<GooglePlace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GooglePlaceCopyWith<$Res> {
  factory $GooglePlaceCopyWith(
          GooglePlace value, $Res Function(GooglePlace) then) =
      _$GooglePlaceCopyWithImpl<$Res, GooglePlace>;
  @useResult
  $Res call({String id, String name, LocationPoint location});

  $LocationPointCopyWith<$Res> get location;
}

/// @nodoc
class _$GooglePlaceCopyWithImpl<$Res, $Val extends GooglePlace>
    implements $GooglePlaceCopyWith<$Res> {
  _$GooglePlaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationPoint,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationPointCopyWith<$Res> get location {
    return $LocationPointCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GooglePlaceCopyWith<$Res>
    implements $GooglePlaceCopyWith<$Res> {
  factory _$$_GooglePlaceCopyWith(
          _$_GooglePlace value, $Res Function(_$_GooglePlace) then) =
      __$$_GooglePlaceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, LocationPoint location});

  @override
  $LocationPointCopyWith<$Res> get location;
}

/// @nodoc
class __$$_GooglePlaceCopyWithImpl<$Res>
    extends _$GooglePlaceCopyWithImpl<$Res, _$_GooglePlace>
    implements _$$_GooglePlaceCopyWith<$Res> {
  __$$_GooglePlaceCopyWithImpl(
      _$_GooglePlace _value, $Res Function(_$_GooglePlace) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? location = null,
  }) {
    return _then(_$_GooglePlace(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationPoint,
    ));
  }
}

/// @nodoc

class _$_GooglePlace implements _GooglePlace {
  _$_GooglePlace(
      {required this.id, required this.name, required this.location});

  @override
  final String id;
  @override
  final String name;
  @override
  final LocationPoint location;

  @override
  String toString() {
    return 'GooglePlace(id: $id, name: $name, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GooglePlace &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GooglePlaceCopyWith<_$_GooglePlace> get copyWith =>
      __$$_GooglePlaceCopyWithImpl<_$_GooglePlace>(this, _$identity);
}

abstract class _GooglePlace implements GooglePlace {
  factory _GooglePlace(
      {required final String id,
      required final String name,
      required final LocationPoint location}) = _$_GooglePlace;

  @override
  String get id;
  @override
  String get name;
  @override
  LocationPoint get location;
  @override
  @JsonKey(ignore: true)
  _$$_GooglePlaceCopyWith<_$_GooglePlace> get copyWith =>
      throw _privateConstructorUsedError;
}

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
