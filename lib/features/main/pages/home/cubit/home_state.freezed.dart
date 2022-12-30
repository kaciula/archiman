// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  RefreshState get refreshState => throw _privateConstructorUsedError;
  KtList<StackUser> get stackUsers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({RefreshState refreshState, KtList<StackUser> stackUsers});

  $RefreshStateCopyWith<$Res> get refreshState;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshState = null,
    Object? stackUsers = null,
  }) {
    return _then(_value.copyWith(
      refreshState: null == refreshState
          ? _value.refreshState
          : refreshState // ignore: cast_nullable_to_non_nullable
              as RefreshState,
      stackUsers: null == stackUsers
          ? _value.stackUsers
          : stackUsers // ignore: cast_nullable_to_non_nullable
              as KtList<StackUser>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RefreshStateCopyWith<$Res> get refreshState {
    return $RefreshStateCopyWith<$Res>(_value.refreshState, (value) {
      return _then(_value.copyWith(refreshState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RefreshState refreshState, KtList<StackUser> stackUsers});

  @override
  $RefreshStateCopyWith<$Res> get refreshState;
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_HomeState>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refreshState = null,
    Object? stackUsers = null,
  }) {
    return _then(_$_HomeState(
      refreshState: null == refreshState
          ? _value.refreshState
          : refreshState // ignore: cast_nullable_to_non_nullable
              as RefreshState,
      stackUsers: null == stackUsers
          ? _value.stackUsers
          : stackUsers // ignore: cast_nullable_to_non_nullable
              as KtList<StackUser>,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  _$_HomeState({required this.refreshState, required this.stackUsers});

  @override
  final RefreshState refreshState;
  @override
  final KtList<StackUser> stackUsers;

  @override
  String toString() {
    return 'HomeState(refreshState: $refreshState, stackUsers: $stackUsers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            (identical(other.refreshState, refreshState) ||
                other.refreshState == refreshState) &&
            (identical(other.stackUsers, stackUsers) ||
                other.stackUsers == stackUsers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, refreshState, stackUsers);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  factory _HomeState(
      {required final RefreshState refreshState,
      required final KtList<StackUser> stackUsers}) = _$_HomeState;

  @override
  RefreshState get refreshState;
  @override
  KtList<StackUser> get stackUsers;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
