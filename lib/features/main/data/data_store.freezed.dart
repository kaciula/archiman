// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
    TResult? Function(KtList<StackUser> stackUsers)? success,
    TResult? Function(String? errorMsg, String? errorDetails)? failure,
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
    TResult? Function(StackUsersSuccess value)? success,
    TResult? Function(StackUsersFailure value)? failure,
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
      _$StackUsersResultCopyWithImpl<$Res, StackUsersResult>;
}

/// @nodoc
class _$StackUsersResultCopyWithImpl<$Res, $Val extends StackUsersResult>
    implements $StackUsersResultCopyWith<$Res> {
  _$StackUsersResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StackUsersSuccessCopyWith<$Res> {
  factory _$$StackUsersSuccessCopyWith(
          _$StackUsersSuccess value, $Res Function(_$StackUsersSuccess) then) =
      __$$StackUsersSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({KtList<StackUser> stackUsers});
}

/// @nodoc
class __$$StackUsersSuccessCopyWithImpl<$Res>
    extends _$StackUsersResultCopyWithImpl<$Res, _$StackUsersSuccess>
    implements _$$StackUsersSuccessCopyWith<$Res> {
  __$$StackUsersSuccessCopyWithImpl(
      _$StackUsersSuccess _value, $Res Function(_$StackUsersSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stackUsers = null,
  }) {
    return _then(_$StackUsersSuccess(
      stackUsers: null == stackUsers
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
            (identical(other.stackUsers, stackUsers) ||
                other.stackUsers == stackUsers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stackUsers);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
    TResult? Function(KtList<StackUser> stackUsers)? success,
    TResult? Function(String? errorMsg, String? errorDetails)? failure,
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
    TResult? Function(StackUsersSuccess value)? success,
    TResult? Function(StackUsersFailure value)? failure,
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

  KtList<StackUser> get stackUsers;
  @JsonKey(ignore: true)
  _$$StackUsersSuccessCopyWith<_$StackUsersSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StackUsersFailureCopyWith<$Res> {
  factory _$$StackUsersFailureCopyWith(
          _$StackUsersFailure value, $Res Function(_$StackUsersFailure) then) =
      __$$StackUsersFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String? errorMsg, String? errorDetails});
}

/// @nodoc
class __$$StackUsersFailureCopyWithImpl<$Res>
    extends _$StackUsersResultCopyWithImpl<$Res, _$StackUsersFailure>
    implements _$$StackUsersFailureCopyWith<$Res> {
  __$$StackUsersFailureCopyWithImpl(
      _$StackUsersFailure _value, $Res Function(_$StackUsersFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMsg = freezed,
    Object? errorDetails = freezed,
  }) {
    return _then(_$StackUsersFailure(
      errorMsg: freezed == errorMsg
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
      errorDetails: freezed == errorDetails
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
            (identical(other.errorMsg, errorMsg) ||
                other.errorMsg == errorMsg) &&
            (identical(other.errorDetails, errorDetails) ||
                other.errorDetails == errorDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMsg, errorDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
    TResult? Function(KtList<StackUser> stackUsers)? success,
    TResult? Function(String? errorMsg, String? errorDetails)? failure,
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
    TResult? Function(StackUsersSuccess value)? success,
    TResult? Function(StackUsersFailure value)? failure,
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

  String? get errorMsg;
  String? get errorDetails;
  @JsonKey(ignore: true)
  _$$StackUsersFailureCopyWith<_$StackUsersFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
