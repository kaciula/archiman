// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'data_store.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StackUsersResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KtList<StackUser> stackUsers) success,
    required TResult Function(String? errorMsg, String? errorDetails) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(KtList<StackUser> stackUsers)? success,
    TResult Function(String? errorMsg, String? errorDetails)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KtList<StackUser> stackUsers)? success,
    TResult Function(String? errorMsg, String? errorDetails)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StackUsersSuccess value) success,
    required TResult Function(StackUsersFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(StackUsersSuccess value)? success,
    TResult Function(StackUsersFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StackUsersSuccess value)? success,
    TResult Function(StackUsersFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StackUsersResultCopyWith<$Res> {
  factory $StackUsersResultCopyWith(
          StackUsersResult value, $Res Function(StackUsersResult) then) =
      _$StackUsersResultCopyWithImpl<$Res>;
}

/// @nodoc
class _$StackUsersResultCopyWithImpl<$Res>
    implements $StackUsersResultCopyWith<$Res> {
  _$StackUsersResultCopyWithImpl(this._value, this._then);

  final StackUsersResult _value;
  // ignore: unused_field
  final $Res Function(StackUsersResult) _then;
}

/// @nodoc
abstract class _$$StackUsersSuccessCopyWith<$Res> {
  factory _$$StackUsersSuccessCopyWith(
          _$StackUsersSuccess value, $Res Function(_$StackUsersSuccess) then) =
      __$$StackUsersSuccessCopyWithImpl<$Res>;
  $Res call({KtList<StackUser> stackUsers});
}

/// @nodoc
class __$$StackUsersSuccessCopyWithImpl<$Res>
    extends _$StackUsersResultCopyWithImpl<$Res>
    implements _$$StackUsersSuccessCopyWith<$Res> {
  __$$StackUsersSuccessCopyWithImpl(
      _$StackUsersSuccess _value, $Res Function(_$StackUsersSuccess) _then)
      : super(_value, (v) => _then(v as _$StackUsersSuccess));

  @override
  _$StackUsersSuccess get _value => super._value as _$StackUsersSuccess;

  @override
  $Res call({
    Object? stackUsers = freezed,
  }) {
    return _then(_$StackUsersSuccess(
      stackUsers: stackUsers == freezed
          ? _value.stackUsers
          : stackUsers // ignore: cast_nullable_to_non_nullable
              as KtList<StackUser>,
    ));
  }
}

/// @nodoc

class _$StackUsersSuccess implements StackUsersSuccess {
  _$StackUsersSuccess({required this.stackUsers});

  @override
  final KtList<StackUser> stackUsers;

  @override
  String toString() {
    return 'StackUsersResult.success(stackUsers: $stackUsers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StackUsersSuccess &&
            const DeepCollectionEquality()
                .equals(other.stackUsers, stackUsers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(stackUsers));

  @JsonKey(ignore: true)
  @override
  _$$StackUsersSuccessCopyWith<_$StackUsersSuccess> get copyWith =>
      __$$StackUsersSuccessCopyWithImpl<_$StackUsersSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KtList<StackUser> stackUsers) success,
    required TResult Function(String? errorMsg, String? errorDetails) failure,
  }) {
    return success(stackUsers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(KtList<StackUser> stackUsers)? success,
    TResult Function(String? errorMsg, String? errorDetails)? failure,
  }) {
    return success?.call(stackUsers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KtList<StackUser> stackUsers)? success,
    TResult Function(String? errorMsg, String? errorDetails)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(stackUsers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StackUsersSuccess value) success,
    required TResult Function(StackUsersFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(StackUsersSuccess value)? success,
    TResult Function(StackUsersFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StackUsersSuccess value)? success,
    TResult Function(StackUsersFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class StackUsersSuccess implements StackUsersResult {
  factory StackUsersSuccess({required final KtList<StackUser> stackUsers}) =
      _$StackUsersSuccess;

  KtList<StackUser> get stackUsers => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$StackUsersSuccessCopyWith<_$StackUsersSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StackUsersFailureCopyWith<$Res> {
  factory _$$StackUsersFailureCopyWith(
          _$StackUsersFailure value, $Res Function(_$StackUsersFailure) then) =
      __$$StackUsersFailureCopyWithImpl<$Res>;
  $Res call({String? errorMsg, String? errorDetails});
}

/// @nodoc
class __$$StackUsersFailureCopyWithImpl<$Res>
    extends _$StackUsersResultCopyWithImpl<$Res>
    implements _$$StackUsersFailureCopyWith<$Res> {
  __$$StackUsersFailureCopyWithImpl(
      _$StackUsersFailure _value, $Res Function(_$StackUsersFailure) _then)
      : super(_value, (v) => _then(v as _$StackUsersFailure));

  @override
  _$StackUsersFailure get _value => super._value as _$StackUsersFailure;

  @override
  $Res call({
    Object? errorMsg = freezed,
    Object? errorDetails = freezed,
  }) {
    return _then(_$StackUsersFailure(
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      errorDetails: errorDetails == freezed
          ? _value.errorDetails
          : errorDetails // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$StackUsersFailure implements StackUsersFailure {
  _$StackUsersFailure({this.errorMsg, this.errorDetails});

  @override
  final String? errorMsg;
  @override
  final String? errorDetails;

  @override
  String toString() {
    return 'StackUsersResult.failure(errorMsg: $errorMsg, errorDetails: $errorDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StackUsersFailure &&
            const DeepCollectionEquality().equals(other.errorMsg, errorMsg) &&
            const DeepCollectionEquality()
                .equals(other.errorDetails, errorDetails));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(errorMsg),
      const DeepCollectionEquality().hash(errorDetails));

  @JsonKey(ignore: true)
  @override
  _$$StackUsersFailureCopyWith<_$StackUsersFailure> get copyWith =>
      __$$StackUsersFailureCopyWithImpl<_$StackUsersFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(KtList<StackUser> stackUsers) success,
    required TResult Function(String? errorMsg, String? errorDetails) failure,
  }) {
    return failure(errorMsg, errorDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(KtList<StackUser> stackUsers)? success,
    TResult Function(String? errorMsg, String? errorDetails)? failure,
  }) {
    return failure?.call(errorMsg, errorDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(KtList<StackUser> stackUsers)? success,
    TResult Function(String? errorMsg, String? errorDetails)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(errorMsg, errorDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StackUsersSuccess value) success,
    required TResult Function(StackUsersFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(StackUsersSuccess value)? success,
    TResult Function(StackUsersFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StackUsersSuccess value)? success,
    TResult Function(StackUsersFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class StackUsersFailure implements StackUsersResult {
  factory StackUsersFailure(
      {final String? errorMsg,
      final String? errorDetails}) = _$StackUsersFailure;

  String? get errorMsg => throw _privateConstructorUsedError;
  String? get errorDetails => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$StackUsersFailureCopyWith<_$StackUsersFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
