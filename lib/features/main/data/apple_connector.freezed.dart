// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apple_connector.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppleSignInResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddress, String? firstName,
            String? lastName, String idToken)
        success,
    required TResult Function() cancelled,
    required TResult Function(String? errorMsg, String? errorDetails) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailAddress, String? firstName, String? lastName,
            String idToken)?
        success,
    TResult? Function()? cancelled,
    TResult? Function(String? errorMsg, String? errorDetails)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddress, String? firstName, String? lastName,
            String idToken)?
        success,
    TResult Function()? cancelled,
    TResult Function(String? errorMsg, String? errorDetails)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppleSignInSuccess value) success,
    required TResult Function(AppleSignInCancelled value) cancelled,
    required TResult Function(AppleSignInFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppleSignInSuccess value)? success,
    TResult? Function(AppleSignInCancelled value)? cancelled,
    TResult? Function(AppleSignInFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppleSignInSuccess value)? success,
    TResult Function(AppleSignInCancelled value)? cancelled,
    TResult Function(AppleSignInFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppleSignInResultCopyWith<$Res> {
  factory $AppleSignInResultCopyWith(
          AppleSignInResult value, $Res Function(AppleSignInResult) then) =
      _$AppleSignInResultCopyWithImpl<$Res, AppleSignInResult>;
}

/// @nodoc
class _$AppleSignInResultCopyWithImpl<$Res, $Val extends AppleSignInResult>
    implements $AppleSignInResultCopyWith<$Res> {
  _$AppleSignInResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AppleSignInSuccessCopyWith<$Res> {
  factory _$$AppleSignInSuccessCopyWith(_$AppleSignInSuccess value,
          $Res Function(_$AppleSignInSuccess) then) =
      __$$AppleSignInSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String emailAddress,
      String? firstName,
      String? lastName,
      String idToken});
}

/// @nodoc
class __$$AppleSignInSuccessCopyWithImpl<$Res>
    extends _$AppleSignInResultCopyWithImpl<$Res, _$AppleSignInSuccess>
    implements _$$AppleSignInSuccessCopyWith<$Res> {
  __$$AppleSignInSuccessCopyWithImpl(
      _$AppleSignInSuccess _value, $Res Function(_$AppleSignInSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? idToken = null,
  }) {
    return _then(_$AppleSignInSuccess(
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      idToken: null == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AppleSignInSuccess implements AppleSignInSuccess {
  _$AppleSignInSuccess(
      {required this.emailAddress,
      required this.firstName,
      required this.lastName,
      required this.idToken});

  @override
  final String emailAddress;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String idToken;

  @override
  String toString() {
    return 'AppleSignInResult.success(emailAddress: $emailAddress, firstName: $firstName, lastName: $lastName, idToken: $idToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppleSignInSuccess &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.idToken, idToken) || other.idToken == idToken));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, emailAddress, firstName, lastName, idToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppleSignInSuccessCopyWith<_$AppleSignInSuccess> get copyWith =>
      __$$AppleSignInSuccessCopyWithImpl<_$AppleSignInSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddress, String? firstName,
            String? lastName, String idToken)
        success,
    required TResult Function() cancelled,
    required TResult Function(String? errorMsg, String? errorDetails) failure,
  }) {
    return success(emailAddress, firstName, lastName, idToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailAddress, String? firstName, String? lastName,
            String idToken)?
        success,
    TResult? Function()? cancelled,
    TResult? Function(String? errorMsg, String? errorDetails)? failure,
  }) {
    return success?.call(emailAddress, firstName, lastName, idToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddress, String? firstName, String? lastName,
            String idToken)?
        success,
    TResult Function()? cancelled,
    TResult Function(String? errorMsg, String? errorDetails)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(emailAddress, firstName, lastName, idToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppleSignInSuccess value) success,
    required TResult Function(AppleSignInCancelled value) cancelled,
    required TResult Function(AppleSignInFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppleSignInSuccess value)? success,
    TResult? Function(AppleSignInCancelled value)? cancelled,
    TResult? Function(AppleSignInFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppleSignInSuccess value)? success,
    TResult Function(AppleSignInCancelled value)? cancelled,
    TResult Function(AppleSignInFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class AppleSignInSuccess implements AppleSignInResult {
  factory AppleSignInSuccess(
      {required final String emailAddress,
      required final String? firstName,
      required final String? lastName,
      required final String idToken}) = _$AppleSignInSuccess;

  String get emailAddress;
  String? get firstName;
  String? get lastName;
  String get idToken;
  @JsonKey(ignore: true)
  _$$AppleSignInSuccessCopyWith<_$AppleSignInSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AppleSignInCancelledCopyWith<$Res> {
  factory _$$AppleSignInCancelledCopyWith(_$AppleSignInCancelled value,
          $Res Function(_$AppleSignInCancelled) then) =
      __$$AppleSignInCancelledCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AppleSignInCancelledCopyWithImpl<$Res>
    extends _$AppleSignInResultCopyWithImpl<$Res, _$AppleSignInCancelled>
    implements _$$AppleSignInCancelledCopyWith<$Res> {
  __$$AppleSignInCancelledCopyWithImpl(_$AppleSignInCancelled _value,
      $Res Function(_$AppleSignInCancelled) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AppleSignInCancelled implements AppleSignInCancelled {
  _$AppleSignInCancelled();

  @override
  String toString() {
    return 'AppleSignInResult.cancelled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AppleSignInCancelled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddress, String? firstName,
            String? lastName, String idToken)
        success,
    required TResult Function() cancelled,
    required TResult Function(String? errorMsg, String? errorDetails) failure,
  }) {
    return cancelled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailAddress, String? firstName, String? lastName,
            String idToken)?
        success,
    TResult? Function()? cancelled,
    TResult? Function(String? errorMsg, String? errorDetails)? failure,
  }) {
    return cancelled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddress, String? firstName, String? lastName,
            String idToken)?
        success,
    TResult Function()? cancelled,
    TResult Function(String? errorMsg, String? errorDetails)? failure,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AppleSignInSuccess value) success,
    required TResult Function(AppleSignInCancelled value) cancelled,
    required TResult Function(AppleSignInFailure value) failure,
  }) {
    return cancelled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppleSignInSuccess value)? success,
    TResult? Function(AppleSignInCancelled value)? cancelled,
    TResult? Function(AppleSignInFailure value)? failure,
  }) {
    return cancelled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppleSignInSuccess value)? success,
    TResult Function(AppleSignInCancelled value)? cancelled,
    TResult Function(AppleSignInFailure value)? failure,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled(this);
    }
    return orElse();
  }
}

abstract class AppleSignInCancelled implements AppleSignInResult {
  factory AppleSignInCancelled() = _$AppleSignInCancelled;
}

/// @nodoc
abstract class _$$AppleSignInFailureCopyWith<$Res> {
  factory _$$AppleSignInFailureCopyWith(_$AppleSignInFailure value,
          $Res Function(_$AppleSignInFailure) then) =
      __$$AppleSignInFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String? errorMsg, String? errorDetails});
}

/// @nodoc
class __$$AppleSignInFailureCopyWithImpl<$Res>
    extends _$AppleSignInResultCopyWithImpl<$Res, _$AppleSignInFailure>
    implements _$$AppleSignInFailureCopyWith<$Res> {
  __$$AppleSignInFailureCopyWithImpl(
      _$AppleSignInFailure _value, $Res Function(_$AppleSignInFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMsg = freezed,
    Object? errorDetails = freezed,
  }) {
    return _then(_$AppleSignInFailure(
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

class _$AppleSignInFailure implements AppleSignInFailure {
  _$AppleSignInFailure({this.errorMsg, this.errorDetails});

  @override
  final String? errorMsg;
  @override
  final String? errorDetails;

  @override
  String toString() {
    return 'AppleSignInResult.failure(errorMsg: $errorMsg, errorDetails: $errorDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppleSignInFailure &&
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
  _$$AppleSignInFailureCopyWith<_$AppleSignInFailure> get copyWith =>
      __$$AppleSignInFailureCopyWithImpl<_$AppleSignInFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String emailAddress, String? firstName,
            String? lastName, String idToken)
        success,
    required TResult Function() cancelled,
    required TResult Function(String? errorMsg, String? errorDetails) failure,
  }) {
    return failure(errorMsg, errorDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailAddress, String? firstName, String? lastName,
            String idToken)?
        success,
    TResult? Function()? cancelled,
    TResult? Function(String? errorMsg, String? errorDetails)? failure,
  }) {
    return failure?.call(errorMsg, errorDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddress, String? firstName, String? lastName,
            String idToken)?
        success,
    TResult Function()? cancelled,
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
    required TResult Function(AppleSignInSuccess value) success,
    required TResult Function(AppleSignInCancelled value) cancelled,
    required TResult Function(AppleSignInFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AppleSignInSuccess value)? success,
    TResult? Function(AppleSignInCancelled value)? cancelled,
    TResult? Function(AppleSignInFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AppleSignInSuccess value)? success,
    TResult Function(AppleSignInCancelled value)? cancelled,
    TResult Function(AppleSignInFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class AppleSignInFailure implements AppleSignInResult {
  factory AppleSignInFailure(
      {final String? errorMsg,
      final String? errorDetails}) = _$AppleSignInFailure;

  String? get errorMsg;
  String? get errorDetails;
  @JsonKey(ignore: true)
  _$$AppleSignInFailureCopyWith<_$AppleSignInFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
