// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'picker_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PickResult {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(File file) success,
    required TResult Function() successSave,
    required TResult Function() galleryPermissionDeniedFailure,
    required TResult Function() cameraPermissionDeniedFailure,
    required TResult Function(double fileSizeInMB) tooLargeFile,
    required TResult Function() cancelled,
    required TResult Function(String? errorDetails) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(File file)? success,
    TResult? Function()? successSave,
    TResult? Function()? galleryPermissionDeniedFailure,
    TResult? Function()? cameraPermissionDeniedFailure,
    TResult? Function(double fileSizeInMB)? tooLargeFile,
    TResult? Function()? cancelled,
    TResult? Function(String? errorDetails)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(File file)? success,
    TResult Function()? successSave,
    TResult Function()? galleryPermissionDeniedFailure,
    TResult Function()? cameraPermissionDeniedFailure,
    TResult Function(double fileSizeInMB)? tooLargeFile,
    TResult Function()? cancelled,
    TResult Function(String? errorDetails)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PickSuccess value) success,
    required TResult Function(PickSuccessSave value) successSave,
    required TResult Function(PickGalleryPermissionDeniedFailure value)
        galleryPermissionDeniedFailure,
    required TResult Function(PickCameraPermissionDeniedFailure value)
        cameraPermissionDeniedFailure,
    required TResult Function(PickTooLargeFile value) tooLargeFile,
    required TResult Function(PickCancelled value) cancelled,
    required TResult Function(PickFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickSuccess value)? success,
    TResult? Function(PickSuccessSave value)? successSave,
    TResult? Function(PickGalleryPermissionDeniedFailure value)?
        galleryPermissionDeniedFailure,
    TResult? Function(PickCameraPermissionDeniedFailure value)?
        cameraPermissionDeniedFailure,
    TResult? Function(PickTooLargeFile value)? tooLargeFile,
    TResult? Function(PickCancelled value)? cancelled,
    TResult? Function(PickFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickSuccess value)? success,
    TResult Function(PickSuccessSave value)? successSave,
    TResult Function(PickGalleryPermissionDeniedFailure value)?
        galleryPermissionDeniedFailure,
    TResult Function(PickCameraPermissionDeniedFailure value)?
        cameraPermissionDeniedFailure,
    TResult Function(PickTooLargeFile value)? tooLargeFile,
    TResult Function(PickCancelled value)? cancelled,
    TResult Function(PickFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickResultCopyWith<$Res> {
  factory $PickResultCopyWith(
          PickResult value, $Res Function(PickResult) then) =
      _$PickResultCopyWithImpl<$Res, PickResult>;
}

/// @nodoc
class _$PickResultCopyWithImpl<$Res, $Val extends PickResult>
    implements $PickResultCopyWith<$Res> {
  _$PickResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PickSuccessCopyWith<$Res> {
  factory _$$PickSuccessCopyWith(
          _$PickSuccess value, $Res Function(_$PickSuccess) then) =
      __$$PickSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({File file});
}

/// @nodoc
class __$$PickSuccessCopyWithImpl<$Res>
    extends _$PickResultCopyWithImpl<$Res, _$PickSuccess>
    implements _$$PickSuccessCopyWith<$Res> {
  __$$PickSuccessCopyWithImpl(
      _$PickSuccess _value, $Res Function(_$PickSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
  }) {
    return _then(_$PickSuccess(
      null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$PickSuccess implements PickSuccess {
  _$PickSuccess(this.file);

  @override
  final File file;

  @override
  String toString() {
    return 'PickResult.success(file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickSuccess &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PickSuccessCopyWith<_$PickSuccess> get copyWith =>
      __$$PickSuccessCopyWithImpl<_$PickSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(File file) success,
    required TResult Function() successSave,
    required TResult Function() galleryPermissionDeniedFailure,
    required TResult Function() cameraPermissionDeniedFailure,
    required TResult Function(double fileSizeInMB) tooLargeFile,
    required TResult Function() cancelled,
    required TResult Function(String? errorDetails) failure,
  }) {
    return success(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(File file)? success,
    TResult? Function()? successSave,
    TResult? Function()? galleryPermissionDeniedFailure,
    TResult? Function()? cameraPermissionDeniedFailure,
    TResult? Function(double fileSizeInMB)? tooLargeFile,
    TResult? Function()? cancelled,
    TResult? Function(String? errorDetails)? failure,
  }) {
    return success?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(File file)? success,
    TResult Function()? successSave,
    TResult Function()? galleryPermissionDeniedFailure,
    TResult Function()? cameraPermissionDeniedFailure,
    TResult Function(double fileSizeInMB)? tooLargeFile,
    TResult Function()? cancelled,
    TResult Function(String? errorDetails)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PickSuccess value) success,
    required TResult Function(PickSuccessSave value) successSave,
    required TResult Function(PickGalleryPermissionDeniedFailure value)
        galleryPermissionDeniedFailure,
    required TResult Function(PickCameraPermissionDeniedFailure value)
        cameraPermissionDeniedFailure,
    required TResult Function(PickTooLargeFile value) tooLargeFile,
    required TResult Function(PickCancelled value) cancelled,
    required TResult Function(PickFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickSuccess value)? success,
    TResult? Function(PickSuccessSave value)? successSave,
    TResult? Function(PickGalleryPermissionDeniedFailure value)?
        galleryPermissionDeniedFailure,
    TResult? Function(PickCameraPermissionDeniedFailure value)?
        cameraPermissionDeniedFailure,
    TResult? Function(PickTooLargeFile value)? tooLargeFile,
    TResult? Function(PickCancelled value)? cancelled,
    TResult? Function(PickFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickSuccess value)? success,
    TResult Function(PickSuccessSave value)? successSave,
    TResult Function(PickGalleryPermissionDeniedFailure value)?
        galleryPermissionDeniedFailure,
    TResult Function(PickCameraPermissionDeniedFailure value)?
        cameraPermissionDeniedFailure,
    TResult Function(PickTooLargeFile value)? tooLargeFile,
    TResult Function(PickCancelled value)? cancelled,
    TResult Function(PickFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class PickSuccess implements PickResult {
  factory PickSuccess(final File file) = _$PickSuccess;

  File get file;
  @JsonKey(ignore: true)
  _$$PickSuccessCopyWith<_$PickSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PickSuccessSaveCopyWith<$Res> {
  factory _$$PickSuccessSaveCopyWith(
          _$PickSuccessSave value, $Res Function(_$PickSuccessSave) then) =
      __$$PickSuccessSaveCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PickSuccessSaveCopyWithImpl<$Res>
    extends _$PickResultCopyWithImpl<$Res, _$PickSuccessSave>
    implements _$$PickSuccessSaveCopyWith<$Res> {
  __$$PickSuccessSaveCopyWithImpl(
      _$PickSuccessSave _value, $Res Function(_$PickSuccessSave) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PickSuccessSave implements PickSuccessSave {
  _$PickSuccessSave();

  @override
  String toString() {
    return 'PickResult.successSave()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PickSuccessSave);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(File file) success,
    required TResult Function() successSave,
    required TResult Function() galleryPermissionDeniedFailure,
    required TResult Function() cameraPermissionDeniedFailure,
    required TResult Function(double fileSizeInMB) tooLargeFile,
    required TResult Function() cancelled,
    required TResult Function(String? errorDetails) failure,
  }) {
    return successSave();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(File file)? success,
    TResult? Function()? successSave,
    TResult? Function()? galleryPermissionDeniedFailure,
    TResult? Function()? cameraPermissionDeniedFailure,
    TResult? Function(double fileSizeInMB)? tooLargeFile,
    TResult? Function()? cancelled,
    TResult? Function(String? errorDetails)? failure,
  }) {
    return successSave?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(File file)? success,
    TResult Function()? successSave,
    TResult Function()? galleryPermissionDeniedFailure,
    TResult Function()? cameraPermissionDeniedFailure,
    TResult Function(double fileSizeInMB)? tooLargeFile,
    TResult Function()? cancelled,
    TResult Function(String? errorDetails)? failure,
    required TResult orElse(),
  }) {
    if (successSave != null) {
      return successSave();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PickSuccess value) success,
    required TResult Function(PickSuccessSave value) successSave,
    required TResult Function(PickGalleryPermissionDeniedFailure value)
        galleryPermissionDeniedFailure,
    required TResult Function(PickCameraPermissionDeniedFailure value)
        cameraPermissionDeniedFailure,
    required TResult Function(PickTooLargeFile value) tooLargeFile,
    required TResult Function(PickCancelled value) cancelled,
    required TResult Function(PickFailure value) failure,
  }) {
    return successSave(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickSuccess value)? success,
    TResult? Function(PickSuccessSave value)? successSave,
    TResult? Function(PickGalleryPermissionDeniedFailure value)?
        galleryPermissionDeniedFailure,
    TResult? Function(PickCameraPermissionDeniedFailure value)?
        cameraPermissionDeniedFailure,
    TResult? Function(PickTooLargeFile value)? tooLargeFile,
    TResult? Function(PickCancelled value)? cancelled,
    TResult? Function(PickFailure value)? failure,
  }) {
    return successSave?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickSuccess value)? success,
    TResult Function(PickSuccessSave value)? successSave,
    TResult Function(PickGalleryPermissionDeniedFailure value)?
        galleryPermissionDeniedFailure,
    TResult Function(PickCameraPermissionDeniedFailure value)?
        cameraPermissionDeniedFailure,
    TResult Function(PickTooLargeFile value)? tooLargeFile,
    TResult Function(PickCancelled value)? cancelled,
    TResult Function(PickFailure value)? failure,
    required TResult orElse(),
  }) {
    if (successSave != null) {
      return successSave(this);
    }
    return orElse();
  }
}

abstract class PickSuccessSave implements PickResult {
  factory PickSuccessSave() = _$PickSuccessSave;
}

/// @nodoc
abstract class _$$PickGalleryPermissionDeniedFailureCopyWith<$Res> {
  factory _$$PickGalleryPermissionDeniedFailureCopyWith(
          _$PickGalleryPermissionDeniedFailure value,
          $Res Function(_$PickGalleryPermissionDeniedFailure) then) =
      __$$PickGalleryPermissionDeniedFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PickGalleryPermissionDeniedFailureCopyWithImpl<$Res>
    extends _$PickResultCopyWithImpl<$Res, _$PickGalleryPermissionDeniedFailure>
    implements _$$PickGalleryPermissionDeniedFailureCopyWith<$Res> {
  __$$PickGalleryPermissionDeniedFailureCopyWithImpl(
      _$PickGalleryPermissionDeniedFailure _value,
      $Res Function(_$PickGalleryPermissionDeniedFailure) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PickGalleryPermissionDeniedFailure
    implements PickGalleryPermissionDeniedFailure {
  _$PickGalleryPermissionDeniedFailure();

  @override
  String toString() {
    return 'PickResult.galleryPermissionDeniedFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickGalleryPermissionDeniedFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(File file) success,
    required TResult Function() successSave,
    required TResult Function() galleryPermissionDeniedFailure,
    required TResult Function() cameraPermissionDeniedFailure,
    required TResult Function(double fileSizeInMB) tooLargeFile,
    required TResult Function() cancelled,
    required TResult Function(String? errorDetails) failure,
  }) {
    return galleryPermissionDeniedFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(File file)? success,
    TResult? Function()? successSave,
    TResult? Function()? galleryPermissionDeniedFailure,
    TResult? Function()? cameraPermissionDeniedFailure,
    TResult? Function(double fileSizeInMB)? tooLargeFile,
    TResult? Function()? cancelled,
    TResult? Function(String? errorDetails)? failure,
  }) {
    return galleryPermissionDeniedFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(File file)? success,
    TResult Function()? successSave,
    TResult Function()? galleryPermissionDeniedFailure,
    TResult Function()? cameraPermissionDeniedFailure,
    TResult Function(double fileSizeInMB)? tooLargeFile,
    TResult Function()? cancelled,
    TResult Function(String? errorDetails)? failure,
    required TResult orElse(),
  }) {
    if (galleryPermissionDeniedFailure != null) {
      return galleryPermissionDeniedFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PickSuccess value) success,
    required TResult Function(PickSuccessSave value) successSave,
    required TResult Function(PickGalleryPermissionDeniedFailure value)
        galleryPermissionDeniedFailure,
    required TResult Function(PickCameraPermissionDeniedFailure value)
        cameraPermissionDeniedFailure,
    required TResult Function(PickTooLargeFile value) tooLargeFile,
    required TResult Function(PickCancelled value) cancelled,
    required TResult Function(PickFailure value) failure,
  }) {
    return galleryPermissionDeniedFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickSuccess value)? success,
    TResult? Function(PickSuccessSave value)? successSave,
    TResult? Function(PickGalleryPermissionDeniedFailure value)?
        galleryPermissionDeniedFailure,
    TResult? Function(PickCameraPermissionDeniedFailure value)?
        cameraPermissionDeniedFailure,
    TResult? Function(PickTooLargeFile value)? tooLargeFile,
    TResult? Function(PickCancelled value)? cancelled,
    TResult? Function(PickFailure value)? failure,
  }) {
    return galleryPermissionDeniedFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickSuccess value)? success,
    TResult Function(PickSuccessSave value)? successSave,
    TResult Function(PickGalleryPermissionDeniedFailure value)?
        galleryPermissionDeniedFailure,
    TResult Function(PickCameraPermissionDeniedFailure value)?
        cameraPermissionDeniedFailure,
    TResult Function(PickTooLargeFile value)? tooLargeFile,
    TResult Function(PickCancelled value)? cancelled,
    TResult Function(PickFailure value)? failure,
    required TResult orElse(),
  }) {
    if (galleryPermissionDeniedFailure != null) {
      return galleryPermissionDeniedFailure(this);
    }
    return orElse();
  }
}

abstract class PickGalleryPermissionDeniedFailure implements PickResult {
  factory PickGalleryPermissionDeniedFailure() =
      _$PickGalleryPermissionDeniedFailure;
}

/// @nodoc
abstract class _$$PickCameraPermissionDeniedFailureCopyWith<$Res> {
  factory _$$PickCameraPermissionDeniedFailureCopyWith(
          _$PickCameraPermissionDeniedFailure value,
          $Res Function(_$PickCameraPermissionDeniedFailure) then) =
      __$$PickCameraPermissionDeniedFailureCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PickCameraPermissionDeniedFailureCopyWithImpl<$Res>
    extends _$PickResultCopyWithImpl<$Res, _$PickCameraPermissionDeniedFailure>
    implements _$$PickCameraPermissionDeniedFailureCopyWith<$Res> {
  __$$PickCameraPermissionDeniedFailureCopyWithImpl(
      _$PickCameraPermissionDeniedFailure _value,
      $Res Function(_$PickCameraPermissionDeniedFailure) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PickCameraPermissionDeniedFailure
    implements PickCameraPermissionDeniedFailure {
  _$PickCameraPermissionDeniedFailure();

  @override
  String toString() {
    return 'PickResult.cameraPermissionDeniedFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickCameraPermissionDeniedFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(File file) success,
    required TResult Function() successSave,
    required TResult Function() galleryPermissionDeniedFailure,
    required TResult Function() cameraPermissionDeniedFailure,
    required TResult Function(double fileSizeInMB) tooLargeFile,
    required TResult Function() cancelled,
    required TResult Function(String? errorDetails) failure,
  }) {
    return cameraPermissionDeniedFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(File file)? success,
    TResult? Function()? successSave,
    TResult? Function()? galleryPermissionDeniedFailure,
    TResult? Function()? cameraPermissionDeniedFailure,
    TResult? Function(double fileSizeInMB)? tooLargeFile,
    TResult? Function()? cancelled,
    TResult? Function(String? errorDetails)? failure,
  }) {
    return cameraPermissionDeniedFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(File file)? success,
    TResult Function()? successSave,
    TResult Function()? galleryPermissionDeniedFailure,
    TResult Function()? cameraPermissionDeniedFailure,
    TResult Function(double fileSizeInMB)? tooLargeFile,
    TResult Function()? cancelled,
    TResult Function(String? errorDetails)? failure,
    required TResult orElse(),
  }) {
    if (cameraPermissionDeniedFailure != null) {
      return cameraPermissionDeniedFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PickSuccess value) success,
    required TResult Function(PickSuccessSave value) successSave,
    required TResult Function(PickGalleryPermissionDeniedFailure value)
        galleryPermissionDeniedFailure,
    required TResult Function(PickCameraPermissionDeniedFailure value)
        cameraPermissionDeniedFailure,
    required TResult Function(PickTooLargeFile value) tooLargeFile,
    required TResult Function(PickCancelled value) cancelled,
    required TResult Function(PickFailure value) failure,
  }) {
    return cameraPermissionDeniedFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickSuccess value)? success,
    TResult? Function(PickSuccessSave value)? successSave,
    TResult? Function(PickGalleryPermissionDeniedFailure value)?
        galleryPermissionDeniedFailure,
    TResult? Function(PickCameraPermissionDeniedFailure value)?
        cameraPermissionDeniedFailure,
    TResult? Function(PickTooLargeFile value)? tooLargeFile,
    TResult? Function(PickCancelled value)? cancelled,
    TResult? Function(PickFailure value)? failure,
  }) {
    return cameraPermissionDeniedFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickSuccess value)? success,
    TResult Function(PickSuccessSave value)? successSave,
    TResult Function(PickGalleryPermissionDeniedFailure value)?
        galleryPermissionDeniedFailure,
    TResult Function(PickCameraPermissionDeniedFailure value)?
        cameraPermissionDeniedFailure,
    TResult Function(PickTooLargeFile value)? tooLargeFile,
    TResult Function(PickCancelled value)? cancelled,
    TResult Function(PickFailure value)? failure,
    required TResult orElse(),
  }) {
    if (cameraPermissionDeniedFailure != null) {
      return cameraPermissionDeniedFailure(this);
    }
    return orElse();
  }
}

abstract class PickCameraPermissionDeniedFailure implements PickResult {
  factory PickCameraPermissionDeniedFailure() =
      _$PickCameraPermissionDeniedFailure;
}

/// @nodoc
abstract class _$$PickTooLargeFileCopyWith<$Res> {
  factory _$$PickTooLargeFileCopyWith(
          _$PickTooLargeFile value, $Res Function(_$PickTooLargeFile) then) =
      __$$PickTooLargeFileCopyWithImpl<$Res>;
  @useResult
  $Res call({double fileSizeInMB});
}

/// @nodoc
class __$$PickTooLargeFileCopyWithImpl<$Res>
    extends _$PickResultCopyWithImpl<$Res, _$PickTooLargeFile>
    implements _$$PickTooLargeFileCopyWith<$Res> {
  __$$PickTooLargeFileCopyWithImpl(
      _$PickTooLargeFile _value, $Res Function(_$PickTooLargeFile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileSizeInMB = null,
  }) {
    return _then(_$PickTooLargeFile(
      fileSizeInMB: null == fileSizeInMB
          ? _value.fileSizeInMB
          : fileSizeInMB // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$PickTooLargeFile implements PickTooLargeFile {
  _$PickTooLargeFile({required this.fileSizeInMB});

  @override
  final double fileSizeInMB;

  @override
  String toString() {
    return 'PickResult.tooLargeFile(fileSizeInMB: $fileSizeInMB)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickTooLargeFile &&
            (identical(other.fileSizeInMB, fileSizeInMB) ||
                other.fileSizeInMB == fileSizeInMB));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fileSizeInMB);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PickTooLargeFileCopyWith<_$PickTooLargeFile> get copyWith =>
      __$$PickTooLargeFileCopyWithImpl<_$PickTooLargeFile>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(File file) success,
    required TResult Function() successSave,
    required TResult Function() galleryPermissionDeniedFailure,
    required TResult Function() cameraPermissionDeniedFailure,
    required TResult Function(double fileSizeInMB) tooLargeFile,
    required TResult Function() cancelled,
    required TResult Function(String? errorDetails) failure,
  }) {
    return tooLargeFile(fileSizeInMB);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(File file)? success,
    TResult? Function()? successSave,
    TResult? Function()? galleryPermissionDeniedFailure,
    TResult? Function()? cameraPermissionDeniedFailure,
    TResult? Function(double fileSizeInMB)? tooLargeFile,
    TResult? Function()? cancelled,
    TResult? Function(String? errorDetails)? failure,
  }) {
    return tooLargeFile?.call(fileSizeInMB);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(File file)? success,
    TResult Function()? successSave,
    TResult Function()? galleryPermissionDeniedFailure,
    TResult Function()? cameraPermissionDeniedFailure,
    TResult Function(double fileSizeInMB)? tooLargeFile,
    TResult Function()? cancelled,
    TResult Function(String? errorDetails)? failure,
    required TResult orElse(),
  }) {
    if (tooLargeFile != null) {
      return tooLargeFile(fileSizeInMB);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PickSuccess value) success,
    required TResult Function(PickSuccessSave value) successSave,
    required TResult Function(PickGalleryPermissionDeniedFailure value)
        galleryPermissionDeniedFailure,
    required TResult Function(PickCameraPermissionDeniedFailure value)
        cameraPermissionDeniedFailure,
    required TResult Function(PickTooLargeFile value) tooLargeFile,
    required TResult Function(PickCancelled value) cancelled,
    required TResult Function(PickFailure value) failure,
  }) {
    return tooLargeFile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickSuccess value)? success,
    TResult? Function(PickSuccessSave value)? successSave,
    TResult? Function(PickGalleryPermissionDeniedFailure value)?
        galleryPermissionDeniedFailure,
    TResult? Function(PickCameraPermissionDeniedFailure value)?
        cameraPermissionDeniedFailure,
    TResult? Function(PickTooLargeFile value)? tooLargeFile,
    TResult? Function(PickCancelled value)? cancelled,
    TResult? Function(PickFailure value)? failure,
  }) {
    return tooLargeFile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickSuccess value)? success,
    TResult Function(PickSuccessSave value)? successSave,
    TResult Function(PickGalleryPermissionDeniedFailure value)?
        galleryPermissionDeniedFailure,
    TResult Function(PickCameraPermissionDeniedFailure value)?
        cameraPermissionDeniedFailure,
    TResult Function(PickTooLargeFile value)? tooLargeFile,
    TResult Function(PickCancelled value)? cancelled,
    TResult Function(PickFailure value)? failure,
    required TResult orElse(),
  }) {
    if (tooLargeFile != null) {
      return tooLargeFile(this);
    }
    return orElse();
  }
}

abstract class PickTooLargeFile implements PickResult {
  factory PickTooLargeFile({required final double fileSizeInMB}) =
      _$PickTooLargeFile;

  double get fileSizeInMB;
  @JsonKey(ignore: true)
  _$$PickTooLargeFileCopyWith<_$PickTooLargeFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PickCancelledCopyWith<$Res> {
  factory _$$PickCancelledCopyWith(
          _$PickCancelled value, $Res Function(_$PickCancelled) then) =
      __$$PickCancelledCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PickCancelledCopyWithImpl<$Res>
    extends _$PickResultCopyWithImpl<$Res, _$PickCancelled>
    implements _$$PickCancelledCopyWith<$Res> {
  __$$PickCancelledCopyWithImpl(
      _$PickCancelled _value, $Res Function(_$PickCancelled) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PickCancelled implements PickCancelled {
  _$PickCancelled();

  @override
  String toString() {
    return 'PickResult.cancelled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PickCancelled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(File file) success,
    required TResult Function() successSave,
    required TResult Function() galleryPermissionDeniedFailure,
    required TResult Function() cameraPermissionDeniedFailure,
    required TResult Function(double fileSizeInMB) tooLargeFile,
    required TResult Function() cancelled,
    required TResult Function(String? errorDetails) failure,
  }) {
    return cancelled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(File file)? success,
    TResult? Function()? successSave,
    TResult? Function()? galleryPermissionDeniedFailure,
    TResult? Function()? cameraPermissionDeniedFailure,
    TResult? Function(double fileSizeInMB)? tooLargeFile,
    TResult? Function()? cancelled,
    TResult? Function(String? errorDetails)? failure,
  }) {
    return cancelled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(File file)? success,
    TResult Function()? successSave,
    TResult Function()? galleryPermissionDeniedFailure,
    TResult Function()? cameraPermissionDeniedFailure,
    TResult Function(double fileSizeInMB)? tooLargeFile,
    TResult Function()? cancelled,
    TResult Function(String? errorDetails)? failure,
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
    required TResult Function(PickSuccess value) success,
    required TResult Function(PickSuccessSave value) successSave,
    required TResult Function(PickGalleryPermissionDeniedFailure value)
        galleryPermissionDeniedFailure,
    required TResult Function(PickCameraPermissionDeniedFailure value)
        cameraPermissionDeniedFailure,
    required TResult Function(PickTooLargeFile value) tooLargeFile,
    required TResult Function(PickCancelled value) cancelled,
    required TResult Function(PickFailure value) failure,
  }) {
    return cancelled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickSuccess value)? success,
    TResult? Function(PickSuccessSave value)? successSave,
    TResult? Function(PickGalleryPermissionDeniedFailure value)?
        galleryPermissionDeniedFailure,
    TResult? Function(PickCameraPermissionDeniedFailure value)?
        cameraPermissionDeniedFailure,
    TResult? Function(PickTooLargeFile value)? tooLargeFile,
    TResult? Function(PickCancelled value)? cancelled,
    TResult? Function(PickFailure value)? failure,
  }) {
    return cancelled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickSuccess value)? success,
    TResult Function(PickSuccessSave value)? successSave,
    TResult Function(PickGalleryPermissionDeniedFailure value)?
        galleryPermissionDeniedFailure,
    TResult Function(PickCameraPermissionDeniedFailure value)?
        cameraPermissionDeniedFailure,
    TResult Function(PickTooLargeFile value)? tooLargeFile,
    TResult Function(PickCancelled value)? cancelled,
    TResult Function(PickFailure value)? failure,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled(this);
    }
    return orElse();
  }
}

abstract class PickCancelled implements PickResult {
  factory PickCancelled() = _$PickCancelled;
}

/// @nodoc
abstract class _$$PickFailureCopyWith<$Res> {
  factory _$$PickFailureCopyWith(
          _$PickFailure value, $Res Function(_$PickFailure) then) =
      __$$PickFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String? errorDetails});
}

/// @nodoc
class __$$PickFailureCopyWithImpl<$Res>
    extends _$PickResultCopyWithImpl<$Res, _$PickFailure>
    implements _$$PickFailureCopyWith<$Res> {
  __$$PickFailureCopyWithImpl(
      _$PickFailure _value, $Res Function(_$PickFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorDetails = freezed,
  }) {
    return _then(_$PickFailure(
      freezed == errorDetails
          ? _value.errorDetails
          : errorDetails // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PickFailure implements PickFailure {
  _$PickFailure(this.errorDetails);

  @override
  final String? errorDetails;

  @override
  String toString() {
    return 'PickResult.failure(errorDetails: $errorDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickFailure &&
            (identical(other.errorDetails, errorDetails) ||
                other.errorDetails == errorDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PickFailureCopyWith<_$PickFailure> get copyWith =>
      __$$PickFailureCopyWithImpl<_$PickFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(File file) success,
    required TResult Function() successSave,
    required TResult Function() galleryPermissionDeniedFailure,
    required TResult Function() cameraPermissionDeniedFailure,
    required TResult Function(double fileSizeInMB) tooLargeFile,
    required TResult Function() cancelled,
    required TResult Function(String? errorDetails) failure,
  }) {
    return failure(errorDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(File file)? success,
    TResult? Function()? successSave,
    TResult? Function()? galleryPermissionDeniedFailure,
    TResult? Function()? cameraPermissionDeniedFailure,
    TResult? Function(double fileSizeInMB)? tooLargeFile,
    TResult? Function()? cancelled,
    TResult? Function(String? errorDetails)? failure,
  }) {
    return failure?.call(errorDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(File file)? success,
    TResult Function()? successSave,
    TResult Function()? galleryPermissionDeniedFailure,
    TResult Function()? cameraPermissionDeniedFailure,
    TResult Function(double fileSizeInMB)? tooLargeFile,
    TResult Function()? cancelled,
    TResult Function(String? errorDetails)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(errorDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PickSuccess value) success,
    required TResult Function(PickSuccessSave value) successSave,
    required TResult Function(PickGalleryPermissionDeniedFailure value)
        galleryPermissionDeniedFailure,
    required TResult Function(PickCameraPermissionDeniedFailure value)
        cameraPermissionDeniedFailure,
    required TResult Function(PickTooLargeFile value) tooLargeFile,
    required TResult Function(PickCancelled value) cancelled,
    required TResult Function(PickFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PickSuccess value)? success,
    TResult? Function(PickSuccessSave value)? successSave,
    TResult? Function(PickGalleryPermissionDeniedFailure value)?
        galleryPermissionDeniedFailure,
    TResult? Function(PickCameraPermissionDeniedFailure value)?
        cameraPermissionDeniedFailure,
    TResult? Function(PickTooLargeFile value)? tooLargeFile,
    TResult? Function(PickCancelled value)? cancelled,
    TResult? Function(PickFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PickSuccess value)? success,
    TResult Function(PickSuccessSave value)? successSave,
    TResult Function(PickGalleryPermissionDeniedFailure value)?
        galleryPermissionDeniedFailure,
    TResult Function(PickCameraPermissionDeniedFailure value)?
        cameraPermissionDeniedFailure,
    TResult Function(PickTooLargeFile value)? tooLargeFile,
    TResult Function(PickCancelled value)? cancelled,
    TResult Function(PickFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class PickFailure implements PickResult {
  factory PickFailure(final String? errorDetails) = _$PickFailure;

  String? get errorDetails;
  @JsonKey(ignore: true)
  _$$PickFailureCopyWith<_$PickFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
