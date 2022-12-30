// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'launcher_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ShareTextResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function(String? errorMsg, String? errorDetails) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? success,
    TResult? Function(String? errorMsg, String? errorDetails)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(String? errorMsg, String? errorDetails)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShareTextSuccess value) success,
    required TResult Function(ShareTextFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShareTextSuccess value)? success,
    TResult? Function(ShareTextFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShareTextSuccess value)? success,
    TResult Function(ShareTextFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShareTextResultCopyWith<$Res> {
  factory $ShareTextResultCopyWith(
          ShareTextResult value, $Res Function(ShareTextResult) then) =
      _$ShareTextResultCopyWithImpl<$Res, ShareTextResult>;
}

/// @nodoc
class _$ShareTextResultCopyWithImpl<$Res, $Val extends ShareTextResult>
    implements $ShareTextResultCopyWith<$Res> {
  _$ShareTextResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ShareTextSuccessCopyWith<$Res> {
  factory _$$ShareTextSuccessCopyWith(
          _$ShareTextSuccess value, $Res Function(_$ShareTextSuccess) then) =
      __$$ShareTextSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShareTextSuccessCopyWithImpl<$Res>
    extends _$ShareTextResultCopyWithImpl<$Res, _$ShareTextSuccess>
    implements _$$ShareTextSuccessCopyWith<$Res> {
  __$$ShareTextSuccessCopyWithImpl(
      _$ShareTextSuccess _value, $Res Function(_$ShareTextSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ShareTextSuccess implements ShareTextSuccess {
  _$ShareTextSuccess();

  @override
  String toString() {
    return 'ShareTextResult.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShareTextSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function(String? errorMsg, String? errorDetails) failure,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? success,
    TResult? Function(String? errorMsg, String? errorDetails)? failure,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function(String? errorMsg, String? errorDetails)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ShareTextSuccess value) success,
    required TResult Function(ShareTextFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShareTextSuccess value)? success,
    TResult? Function(ShareTextFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShareTextSuccess value)? success,
    TResult Function(ShareTextFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ShareTextSuccess implements ShareTextResult {
  factory ShareTextSuccess() = _$ShareTextSuccess;
}

/// @nodoc
abstract class _$$ShareTextFailureCopyWith<$Res> {
  factory _$$ShareTextFailureCopyWith(
          _$ShareTextFailure value, $Res Function(_$ShareTextFailure) then) =
      __$$ShareTextFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String? errorMsg, String? errorDetails});
}

/// @nodoc
class __$$ShareTextFailureCopyWithImpl<$Res>
    extends _$ShareTextResultCopyWithImpl<$Res, _$ShareTextFailure>
    implements _$$ShareTextFailureCopyWith<$Res> {
  __$$ShareTextFailureCopyWithImpl(
      _$ShareTextFailure _value, $Res Function(_$ShareTextFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMsg = freezed,
    Object? errorDetails = freezed,
  }) {
    return _then(_$ShareTextFailure(
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

class _$ShareTextFailure implements ShareTextFailure {
  _$ShareTextFailure({this.errorMsg, this.errorDetails});

  @override
  final String? errorMsg;
  @override
  final String? errorDetails;

  @override
  String toString() {
    return 'ShareTextResult.failure(errorMsg: $errorMsg, errorDetails: $errorDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShareTextFailure &&
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
  _$$ShareTextFailureCopyWith<_$ShareTextFailure> get copyWith =>
      __$$ShareTextFailureCopyWithImpl<_$ShareTextFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function(String? errorMsg, String? errorDetails) failure,
  }) {
    return failure(errorMsg, errorDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? success,
    TResult? Function(String? errorMsg, String? errorDetails)? failure,
  }) {
    return failure?.call(errorMsg, errorDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
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
    required TResult Function(ShareTextSuccess value) success,
    required TResult Function(ShareTextFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ShareTextSuccess value)? success,
    TResult? Function(ShareTextFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ShareTextSuccess value)? success,
    TResult Function(ShareTextFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class ShareTextFailure implements ShareTextResult {
  factory ShareTextFailure(
      {final String? errorMsg,
      final String? errorDetails}) = _$ShareTextFailure;

  String? get errorMsg;
  String? get errorDetails;
  @JsonKey(ignore: true)
  _$$ShareTextFailureCopyWith<_$ShareTextFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
