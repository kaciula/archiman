// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'google_connector.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GoogleSignInResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String emailAddress, String fullName, String idToken)
        success,
    required TResult Function() cancel,
    required TResult Function(String? errorMsg, String? errorDetails) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailAddress, String fullName, String idToken)?
        success,
    TResult? Function()? cancel,
    TResult? Function(String? errorMsg, String? errorDetails)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddress, String fullName, String idToken)?
        success,
    TResult Function()? cancel,
    TResult Function(String? errorMsg, String? errorDetails)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GoogleSignInSuccess value) success,
    required TResult Function(GoogleSignInCancel value) cancel,
    required TResult Function(GoogleSignInFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GoogleSignInSuccess value)? success,
    TResult? Function(GoogleSignInCancel value)? cancel,
    TResult? Function(GoogleSignInFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoogleSignInSuccess value)? success,
    TResult Function(GoogleSignInCancel value)? cancel,
    TResult Function(GoogleSignInFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleSignInResultCopyWith<$Res> {
  factory $GoogleSignInResultCopyWith(
          GoogleSignInResult value, $Res Function(GoogleSignInResult) then) =
      _$GoogleSignInResultCopyWithImpl<$Res, GoogleSignInResult>;
}

/// @nodoc
class _$GoogleSignInResultCopyWithImpl<$Res, $Val extends GoogleSignInResult>
    implements $GoogleSignInResultCopyWith<$Res> {
  _$GoogleSignInResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GoogleSignInSuccessCopyWith<$Res> {
  factory _$$GoogleSignInSuccessCopyWith(_$GoogleSignInSuccess value,
          $Res Function(_$GoogleSignInSuccess) then) =
      __$$GoogleSignInSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({String emailAddress, String fullName, String idToken});
}

/// @nodoc
class __$$GoogleSignInSuccessCopyWithImpl<$Res>
    extends _$GoogleSignInResultCopyWithImpl<$Res, _$GoogleSignInSuccess>
    implements _$$GoogleSignInSuccessCopyWith<$Res> {
  __$$GoogleSignInSuccessCopyWithImpl(
      _$GoogleSignInSuccess _value, $Res Function(_$GoogleSignInSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailAddress = null,
    Object? fullName = null,
    Object? idToken = null,
  }) {
    return _then(_$GoogleSignInSuccess(
      emailAddress: null == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      idToken: null == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GoogleSignInSuccess implements GoogleSignInSuccess {
  _$GoogleSignInSuccess(
      {required this.emailAddress,
      required this.fullName,
      required this.idToken});

  @override
  final String emailAddress;
  @override
  final String fullName;
  @override
  final String idToken;

  @override
  String toString() {
    return 'GoogleSignInResult.success(emailAddress: $emailAddress, fullName: $fullName, idToken: $idToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleSignInSuccess &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.idToken, idToken) || other.idToken == idToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailAddress, fullName, idToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoogleSignInSuccessCopyWith<_$GoogleSignInSuccess> get copyWith =>
      __$$GoogleSignInSuccessCopyWithImpl<_$GoogleSignInSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String emailAddress, String fullName, String idToken)
        success,
    required TResult Function() cancel,
    required TResult Function(String? errorMsg, String? errorDetails) failure,
  }) {
    return success(emailAddress, fullName, idToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailAddress, String fullName, String idToken)?
        success,
    TResult? Function()? cancel,
    TResult? Function(String? errorMsg, String? errorDetails)? failure,
  }) {
    return success?.call(emailAddress, fullName, idToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddress, String fullName, String idToken)?
        success,
    TResult Function()? cancel,
    TResult Function(String? errorMsg, String? errorDetails)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(emailAddress, fullName, idToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GoogleSignInSuccess value) success,
    required TResult Function(GoogleSignInCancel value) cancel,
    required TResult Function(GoogleSignInFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GoogleSignInSuccess value)? success,
    TResult? Function(GoogleSignInCancel value)? cancel,
    TResult? Function(GoogleSignInFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoogleSignInSuccess value)? success,
    TResult Function(GoogleSignInCancel value)? cancel,
    TResult Function(GoogleSignInFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class GoogleSignInSuccess implements GoogleSignInResult {
  factory GoogleSignInSuccess(
      {required final String emailAddress,
      required final String fullName,
      required final String idToken}) = _$GoogleSignInSuccess;

  String get emailAddress;
  String get fullName;
  String get idToken;
  @JsonKey(ignore: true)
  _$$GoogleSignInSuccessCopyWith<_$GoogleSignInSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GoogleSignInCancelCopyWith<$Res> {
  factory _$$GoogleSignInCancelCopyWith(_$GoogleSignInCancel value,
          $Res Function(_$GoogleSignInCancel) then) =
      __$$GoogleSignInCancelCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleSignInCancelCopyWithImpl<$Res>
    extends _$GoogleSignInResultCopyWithImpl<$Res, _$GoogleSignInCancel>
    implements _$$GoogleSignInCancelCopyWith<$Res> {
  __$$GoogleSignInCancelCopyWithImpl(
      _$GoogleSignInCancel _value, $Res Function(_$GoogleSignInCancel) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GoogleSignInCancel implements GoogleSignInCancel {
  _$GoogleSignInCancel();

  @override
  String toString() {
    return 'GoogleSignInResult.cancel()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GoogleSignInCancel);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String emailAddress, String fullName, String idToken)
        success,
    required TResult Function() cancel,
    required TResult Function(String? errorMsg, String? errorDetails) failure,
  }) {
    return cancel();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailAddress, String fullName, String idToken)?
        success,
    TResult? Function()? cancel,
    TResult? Function(String? errorMsg, String? errorDetails)? failure,
  }) {
    return cancel?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddress, String fullName, String idToken)?
        success,
    TResult Function()? cancel,
    TResult Function(String? errorMsg, String? errorDetails)? failure,
    required TResult orElse(),
  }) {
    if (cancel != null) {
      return cancel();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GoogleSignInSuccess value) success,
    required TResult Function(GoogleSignInCancel value) cancel,
    required TResult Function(GoogleSignInFailure value) failure,
  }) {
    return cancel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GoogleSignInSuccess value)? success,
    TResult? Function(GoogleSignInCancel value)? cancel,
    TResult? Function(GoogleSignInFailure value)? failure,
  }) {
    return cancel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoogleSignInSuccess value)? success,
    TResult Function(GoogleSignInCancel value)? cancel,
    TResult Function(GoogleSignInFailure value)? failure,
    required TResult orElse(),
  }) {
    if (cancel != null) {
      return cancel(this);
    }
    return orElse();
  }
}

abstract class GoogleSignInCancel implements GoogleSignInResult {
  factory GoogleSignInCancel() = _$GoogleSignInCancel;
}

/// @nodoc
abstract class _$$GoogleSignInFailureCopyWith<$Res> {
  factory _$$GoogleSignInFailureCopyWith(_$GoogleSignInFailure value,
          $Res Function(_$GoogleSignInFailure) then) =
      __$$GoogleSignInFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String? errorMsg, String? errorDetails});
}

/// @nodoc
class __$$GoogleSignInFailureCopyWithImpl<$Res>
    extends _$GoogleSignInResultCopyWithImpl<$Res, _$GoogleSignInFailure>
    implements _$$GoogleSignInFailureCopyWith<$Res> {
  __$$GoogleSignInFailureCopyWithImpl(
      _$GoogleSignInFailure _value, $Res Function(_$GoogleSignInFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMsg = freezed,
    Object? errorDetails = freezed,
  }) {
    return _then(_$GoogleSignInFailure(
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

class _$GoogleSignInFailure implements GoogleSignInFailure {
  _$GoogleSignInFailure({this.errorMsg, this.errorDetails});

  @override
  final String? errorMsg;
  @override
  final String? errorDetails;

  @override
  String toString() {
    return 'GoogleSignInResult.failure(errorMsg: $errorMsg, errorDetails: $errorDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleSignInFailure &&
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
  _$$GoogleSignInFailureCopyWith<_$GoogleSignInFailure> get copyWith =>
      __$$GoogleSignInFailureCopyWithImpl<_$GoogleSignInFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String emailAddress, String fullName, String idToken)
        success,
    required TResult Function() cancel,
    required TResult Function(String? errorMsg, String? errorDetails) failure,
  }) {
    return failure(errorMsg, errorDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String emailAddress, String fullName, String idToken)?
        success,
    TResult? Function()? cancel,
    TResult? Function(String? errorMsg, String? errorDetails)? failure,
  }) {
    return failure?.call(errorMsg, errorDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String emailAddress, String fullName, String idToken)?
        success,
    TResult Function()? cancel,
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
    required TResult Function(GoogleSignInSuccess value) success,
    required TResult Function(GoogleSignInCancel value) cancel,
    required TResult Function(GoogleSignInFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GoogleSignInSuccess value)? success,
    TResult? Function(GoogleSignInCancel value)? cancel,
    TResult? Function(GoogleSignInFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GoogleSignInSuccess value)? success,
    TResult Function(GoogleSignInCancel value)? cancel,
    TResult Function(GoogleSignInFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class GoogleSignInFailure implements GoogleSignInResult {
  factory GoogleSignInFailure(
      {final String? errorMsg,
      final String? errorDetails}) = _$GoogleSignInFailure;

  String? get errorMsg;
  String? get errorDetails;
  @JsonKey(ignore: true)
  _$$GoogleSignInFailureCopyWith<_$GoogleSignInFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
