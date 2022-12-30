// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stack_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StackUser {
  int get accountId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StackUserCopyWith<StackUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StackUserCopyWith<$Res> {
  factory $StackUserCopyWith(StackUser value, $Res Function(StackUser) then) =
      _$StackUserCopyWithImpl<$Res, StackUser>;
  @useResult
  $Res call({int accountId, String name});
}

/// @nodoc
class _$StackUserCopyWithImpl<$Res, $Val extends StackUser>
    implements $StackUserCopyWith<$Res> {
  _$StackUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StackUserCopyWith<$Res> implements $StackUserCopyWith<$Res> {
  factory _$$_StackUserCopyWith(
          _$_StackUser value, $Res Function(_$_StackUser) then) =
      __$$_StackUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int accountId, String name});
}

/// @nodoc
class __$$_StackUserCopyWithImpl<$Res>
    extends _$StackUserCopyWithImpl<$Res, _$_StackUser>
    implements _$$_StackUserCopyWith<$Res> {
  __$$_StackUserCopyWithImpl(
      _$_StackUser _value, $Res Function(_$_StackUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountId = null,
    Object? name = null,
  }) {
    return _then(_$_StackUser(
      accountId: null == accountId
          ? _value.accountId
          : accountId // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_StackUser implements _StackUser {
  _$_StackUser({required this.accountId, required this.name});

  @override
  final int accountId;
  @override
  final String name;

  @override
  String toString() {
    return 'StackUser(accountId: $accountId, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StackUser &&
            (identical(other.accountId, accountId) ||
                other.accountId == accountId) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountId, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StackUserCopyWith<_$_StackUser> get copyWith =>
      __$$_StackUserCopyWithImpl<_$_StackUser>(this, _$identity);
}

abstract class _StackUser implements StackUser {
  factory _StackUser(
      {required final int accountId,
      required final String name}) = _$_StackUser;

  @override
  int get accountId;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_StackUserCopyWith<_$_StackUser> get copyWith =>
      throw _privateConstructorUsedError;
}
