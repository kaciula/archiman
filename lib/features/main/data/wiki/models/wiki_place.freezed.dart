// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wiki_place.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WikiPlace {
  int get wikiId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  LocationPoint get location => throw _privateConstructorUsedError;
  String get webPage => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WikiPlaceCopyWith<WikiPlace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WikiPlaceCopyWith<$Res> {
  factory $WikiPlaceCopyWith(WikiPlace value, $Res Function(WikiPlace) then) =
      _$WikiPlaceCopyWithImpl<$Res, WikiPlace>;
  @useResult
  $Res call(
      {int wikiId,
      String title,
      LocationPoint location,
      String webPage,
      double distance});

  $LocationPointCopyWith<$Res> get location;
}

/// @nodoc
class _$WikiPlaceCopyWithImpl<$Res, $Val extends WikiPlace>
    implements $WikiPlaceCopyWith<$Res> {
  _$WikiPlaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wikiId = null,
    Object? title = null,
    Object? location = null,
    Object? webPage = null,
    Object? distance = null,
  }) {
    return _then(_value.copyWith(
      wikiId: null == wikiId
          ? _value.wikiId
          : wikiId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationPoint,
      webPage: null == webPage
          ? _value.webPage
          : webPage // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
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
abstract class _$$_WikiPlaceCopyWith<$Res> implements $WikiPlaceCopyWith<$Res> {
  factory _$$_WikiPlaceCopyWith(
          _$_WikiPlace value, $Res Function(_$_WikiPlace) then) =
      __$$_WikiPlaceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int wikiId,
      String title,
      LocationPoint location,
      String webPage,
      double distance});

  @override
  $LocationPointCopyWith<$Res> get location;
}

/// @nodoc
class __$$_WikiPlaceCopyWithImpl<$Res>
    extends _$WikiPlaceCopyWithImpl<$Res, _$_WikiPlace>
    implements _$$_WikiPlaceCopyWith<$Res> {
  __$$_WikiPlaceCopyWithImpl(
      _$_WikiPlace _value, $Res Function(_$_WikiPlace) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wikiId = null,
    Object? title = null,
    Object? location = null,
    Object? webPage = null,
    Object? distance = null,
  }) {
    return _then(_$_WikiPlace(
      wikiId: null == wikiId
          ? _value.wikiId
          : wikiId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationPoint,
      webPage: null == webPage
          ? _value.webPage
          : webPage // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_WikiPlace implements _WikiPlace {
  _$_WikiPlace(
      {required this.wikiId,
      required this.title,
      required this.location,
      required this.webPage,
      required this.distance});

  @override
  final int wikiId;
  @override
  final String title;
  @override
  final LocationPoint location;
  @override
  final String webPage;
  @override
  final double distance;

  @override
  String toString() {
    return 'WikiPlace(wikiId: $wikiId, title: $title, location: $location, webPage: $webPage, distance: $distance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WikiPlace &&
            (identical(other.wikiId, wikiId) || other.wikiId == wikiId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.webPage, webPage) || other.webPage == webPage) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, wikiId, title, location, webPage, distance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WikiPlaceCopyWith<_$_WikiPlace> get copyWith =>
      __$$_WikiPlaceCopyWithImpl<_$_WikiPlace>(this, _$identity);
}

abstract class _WikiPlace implements WikiPlace {
  factory _WikiPlace(
      {required final int wikiId,
      required final String title,
      required final LocationPoint location,
      required final String webPage,
      required final double distance}) = _$_WikiPlace;

  @override
  int get wikiId;
  @override
  String get title;
  @override
  LocationPoint get location;
  @override
  String get webPage;
  @override
  double get distance;
  @override
  @JsonKey(ignore: true)
  _$$_WikiPlaceCopyWith<_$_WikiPlace> get copyWith =>
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
