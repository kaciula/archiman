// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserDetailsState {
  StackUser get user => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDetailsStateCopyWith<UserDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDetailsStateCopyWith<$Res> {
  factory $UserDetailsStateCopyWith(
          UserDetailsState value, $Res Function(UserDetailsState) then) =
      _$UserDetailsStateCopyWithImpl<$Res, UserDetailsState>;
  @useResult
  $Res call({StackUser user});

  $StackUserCopyWith<$Res> get user;
}

/// @nodoc
class _$UserDetailsStateCopyWithImpl<$Res, $Val extends UserDetailsState>
    implements $UserDetailsStateCopyWith<$Res> {
  _$UserDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as StackUser,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StackUserCopyWith<$Res> get user {
    return $StackUserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserDetailsStateCopyWith<$Res>
    implements $UserDetailsStateCopyWith<$Res> {
  factory _$$_UserDetailsStateCopyWith(
          _$_UserDetailsState value, $Res Function(_$_UserDetailsState) then) =
      __$$_UserDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StackUser user});

  @override
  $StackUserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_UserDetailsStateCopyWithImpl<$Res>
    extends _$UserDetailsStateCopyWithImpl<$Res, _$_UserDetailsState>
    implements _$$_UserDetailsStateCopyWith<$Res> {
  __$$_UserDetailsStateCopyWithImpl(
      _$_UserDetailsState _value, $Res Function(_$_UserDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$_UserDetailsState(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as StackUser,
    ));
  }
}

/// @nodoc

class _$_UserDetailsState implements _UserDetailsState {
  _$_UserDetailsState({required this.user});

  @override
  final StackUser user;

  @override
  String toString() {
    return 'UserDetailsState(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDetailsState &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDetailsStateCopyWith<_$_UserDetailsState> get copyWith =>
      __$$_UserDetailsStateCopyWithImpl<_$_UserDetailsState>(this, _$identity);
}

abstract class _UserDetailsState implements UserDetailsState {
  factory _UserDetailsState({required final StackUser user}) =
      _$_UserDetailsState;

  @override
  StackUser get user;
  @override
  @JsonKey(ignore: true)
  _$$_UserDetailsStateCopyWith<_$_UserDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
