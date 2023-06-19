// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeviceInfo {
  String get installationId => throw _privateConstructorUsedError;
  String get recognizableName => throw _privateConstructorUsedError;
  String get osVersion => throw _privateConstructorUsedError;

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
  $Res call({String installationId, String recognizableName, String osVersion});
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
    Object? installationId = null,
    Object? recognizableName = null,
    Object? osVersion = null,
  }) {
    return _then(_value.copyWith(
      installationId: null == installationId
          ? _value.installationId
          : installationId // ignore: cast_nullable_to_non_nullable
              as String,
      recognizableName: null == recognizableName
          ? _value.recognizableName
          : recognizableName // ignore: cast_nullable_to_non_nullable
              as String,
      osVersion: null == osVersion
          ? _value.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
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
  $Res call({String installationId, String recognizableName, String osVersion});
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
    Object? installationId = null,
    Object? recognizableName = null,
    Object? osVersion = null,
  }) {
    return _then(_$_DeviceInfo(
      installationId: null == installationId
          ? _value.installationId
          : installationId // ignore: cast_nullable_to_non_nullable
              as String,
      recognizableName: null == recognizableName
          ? _value.recognizableName
          : recognizableName // ignore: cast_nullable_to_non_nullable
              as String,
      osVersion: null == osVersion
          ? _value.osVersion
          : osVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeviceInfo implements _DeviceInfo {
  _$_DeviceInfo(
      {required this.installationId,
      required this.recognizableName,
      required this.osVersion});

  @override
  final String installationId;
  @override
  final String recognizableName;
  @override
  final String osVersion;

  @override
  String toString() {
    return 'DeviceInfo(installationId: $installationId, recognizableName: $recognizableName, osVersion: $osVersion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviceInfo &&
            (identical(other.installationId, installationId) ||
                other.installationId == installationId) &&
            (identical(other.recognizableName, recognizableName) ||
                other.recognizableName == recognizableName) &&
            (identical(other.osVersion, osVersion) ||
                other.osVersion == osVersion));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, installationId, recognizableName, osVersion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeviceInfoCopyWith<_$_DeviceInfo> get copyWith =>
      __$$_DeviceInfoCopyWithImpl<_$_DeviceInfo>(this, _$identity);
}

abstract class _DeviceInfo implements DeviceInfo {
  factory _DeviceInfo(
      {required final String installationId,
      required final String recognizableName,
      required final String osVersion}) = _$_DeviceInfo;

  @override
  String get installationId;
  @override
  String get recognizableName;
  @override
  String get osVersion;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceInfoCopyWith<_$_DeviceInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
