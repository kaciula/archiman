// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'facebook_connector.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FacebookSignInResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddress, String firstName,
            String lastName, String userId)
        success,
    required TResult Function(String? errorMsg, String? errorDetails) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailAddress, String firstName, String lastName,
            String userId)?
        success,
    TResult? Function(String? errorMsg, String? errorDetails)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddress, String firstName, String lastName,
            String userId)?
        success,
    TResult Function(String? errorMsg, String? errorDetails)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FacebookSignInSuccess value) success,
    required TResult Function(FacebookSignInFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FacebookSignInSuccess value)? success,
    TResult? Function(FacebookSignInFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FacebookSignInSuccess value)? success,
    TResult Function(FacebookSignInFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacebookSignInResultCopyWith<$Res> {
  factory $FacebookSignInResultCopyWith(FacebookSignInResult value,
          $Res Function(FacebookSignInResult) then) =
      _$FacebookSignInResultCopyWithImpl<$Res, FacebookSignInResult>;
}

/// @nodoc
class _$FacebookSignInResultCopyWithImpl<$Res,
        $Val extends FacebookSignInResult>
    implements $FacebookSignInResultCopyWith<$Res> {
  _$FacebookSignInResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FacebookSignInSuccessCopyWith<$Res> {
  factory _$$FacebookSignInSuccessCopyWith(_$FacebookSignInSuccess value,
          $Res Function(_$FacebookSignInSuccess) then) =
      __$$FacebookSignInSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String emailAddress, String firstName, String lastName, String userId});
}

/// @nodoc
class __$$FacebookSignInSuccessCopyWithImpl<$Res>
    extends _$FacebookSignInResultCopyWithImpl<$Res, _$FacebookSignInSuccess>
    implements _$$FacebookSignInSuccessCopyWith<$Res> {
  __$$FacebookSignInSuccessCopyWithImpl(_$FacebookSignInSuccess _value,
      $Res Function(_$FacebookSignInSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? userId = null,
  }) {
    return _then(_$FacebookSignInSuccess(
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FacebookSignInSuccess implements FacebookSignInSuccess {
  _$FacebookSignInSuccess(
      {required this.emailAddress,
      required this.firstName,
      required this.lastName,
      required this.userId});

  @override
  final String emailAddress;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String userId;

  @override
  String toString() {
    return 'FacebookSignInResult.success(emailAddress: $emailAddress, firstName: $firstName, lastName: $lastName, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacebookSignInSuccess &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, emailAddress, firstName, lastName, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FacebookSignInSuccessCopyWith<_$FacebookSignInSuccess> get copyWith =>
      __$$FacebookSignInSuccessCopyWithImpl<_$FacebookSignInSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddress, String firstName,
            String lastName, String userId)
        success,
    required TResult Function(String? errorMsg, String? errorDetails) failure,
  }) {
    return success(emailAddress, firstName, lastName, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailAddress, String firstName, String lastName,
            String userId)?
        success,
    TResult? Function(String? errorMsg, String? errorDetails)? failure,
  }) {
    return success?.call(emailAddress, firstName, lastName, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddress, String firstName, String lastName,
            String userId)?
        success,
    TResult Function(String? errorMsg, String? errorDetails)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(emailAddress, firstName, lastName, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FacebookSignInSuccess value) success,
    required TResult Function(FacebookSignInFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FacebookSignInSuccess value)? success,
    TResult? Function(FacebookSignInFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FacebookSignInSuccess value)? success,
    TResult Function(FacebookSignInFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class FacebookSignInSuccess implements FacebookSignInResult {
  factory FacebookSignInSuccess(
      {required final String emailAddress,
      required final String firstName,
      required final String lastName,
      required final String userId}) = _$FacebookSignInSuccess;

  String get emailAddress;
  String get firstName;
  String get lastName;
  String get userId;
  @JsonKey(ignore: true)
  _$$FacebookSignInSuccessCopyWith<_$FacebookSignInSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FacebookSignInFailureCopyWith<$Res> {
  factory _$$FacebookSignInFailureCopyWith(_$FacebookSignInFailure value,
          $Res Function(_$FacebookSignInFailure) then) =
      __$$FacebookSignInFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String? errorMsg, String? errorDetails});
}

/// @nodoc
class __$$FacebookSignInFailureCopyWithImpl<$Res>
    extends _$FacebookSignInResultCopyWithImpl<$Res, _$FacebookSignInFailure>
    implements _$$FacebookSignInFailureCopyWith<$Res> {
  __$$FacebookSignInFailureCopyWithImpl(_$FacebookSignInFailure _value,
      $Res Function(_$FacebookSignInFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMsg = freezed,
    Object? errorDetails = freezed,
  }) {
    return _then(_$FacebookSignInFailure(
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

class _$FacebookSignInFailure implements FacebookSignInFailure {
  _$FacebookSignInFailure({this.errorMsg, this.errorDetails});

  @override
  final String? errorMsg;
  @override
  final String? errorDetails;

  @override
  String toString() {
    return 'FacebookSignInResult.failure(errorMsg: $errorMsg, errorDetails: $errorDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FacebookSignInFailure &&
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
  _$$FacebookSignInFailureCopyWith<_$FacebookSignInFailure> get copyWith =>
      __$$FacebookSignInFailureCopyWithImpl<_$FacebookSignInFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddress, String firstName,
            String lastName, String userId)
        success,
    required TResult Function(String? errorMsg, String? errorDetails) failure,
  }) {
    return failure(errorMsg, errorDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailAddress, String firstName, String lastName,
            String userId)?
        success,
    TResult? Function(String? errorMsg, String? errorDetails)? failure,
  }) {
    return failure?.call(errorMsg, errorDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddress, String firstName, String lastName,
            String userId)?
        success,
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
    required TResult Function(FacebookSignInSuccess value) success,
    required TResult Function(FacebookSignInFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FacebookSignInSuccess value)? success,
    TResult? Function(FacebookSignInFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FacebookSignInSuccess value)? success,
    TResult Function(FacebookSignInFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class FacebookSignInFailure implements FacebookSignInResult {
  factory FacebookSignInFailure(
      {final String? errorMsg,
      final String? errorDetails}) = _$FacebookSignInFailure;

  String? get errorMsg;
  String? get errorDetails;
  @JsonKey(ignore: true)
  _$$FacebookSignInFailureCopyWith<_$FacebookSignInFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
