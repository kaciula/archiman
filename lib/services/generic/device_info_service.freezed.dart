// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_info_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeviceInfo {
  String get brand => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviceInfoCopyWith<DeviceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceInfoCopyWith<$Res> {
  factory $DeviceInfoCopyWith(
          DeviceInfo value, $Res Function(DeviceInfo) then) =
      _$DeviceInfoCopyWithImpl<$Res, DeviceInfo>;
  @useResult
  $Res call({String brand, String model, String version, String id});
}

/// @nodoc
class _$DeviceInfoCopyWithImpl<$Res, $Val extends DeviceInfo>
    implements $DeviceInfoCopyWith<$Res> {
  _$DeviceInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brand = null,
    Object? model = null,
    Object? version = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeviceInfoCopyWith<$Res>
    implements $DeviceInfoCopyWith<$Res> {
  factory _$$_DeviceInfoCopyWith(
          _$_DeviceInfo value, $Res Function(_$_DeviceInfo) then) =
      __$$_DeviceInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String brand, String model, String version, String id});
}

/// @nodoc
class __$$_DeviceInfoCopyWithImpl<$Res>
    extends _$DeviceInfoCopyWithImpl<$Res, _$_DeviceInfo>
    implements _$$_DeviceInfoCopyWith<$Res> {
  __$$_DeviceInfoCopyWithImpl(
      _$_DeviceInfo _value, $Res Function(_$_DeviceInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? brand = null,
    Object? model = null,
    Object? version = null,
    Object? id = null,
  }) {
    return _then(_$_DeviceInfo(
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeviceInfo implements _DeviceInfo {
  _$_DeviceInfo(
      {required this.brand,
      required this.model,
      required this.version,
      required this.id});

  @override
  final String brand;
  @override
  final String model;
  @override
  final String version;
  @override
  final String id;

  @override
  String toString() {
    return 'DeviceInfo(brand: $brand, model: $model, version: $version, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviceInfo &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, brand, model, version, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeviceInfoCopyWith<_$_DeviceInfo> get copyWith =>
      __$$_DeviceInfoCopyWithImpl<_$_DeviceInfo>(this, _$identity);
}

abstract class _DeviceInfo implements DeviceInfo {
  factory _DeviceInfo(
      {required final String brand,
      required final String model,
      required final String version,
      required final String id}) = _$_DeviceInfo;

  @override
  String get brand;
  @override
  String get model;
  @override
  String get version;
  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceInfoCopyWith<_$_DeviceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
