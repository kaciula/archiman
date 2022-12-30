// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_sequence_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AudioSequenceState {
  String get currentTrackId => throw _privateConstructorUsedError;
  KtList<String> get queue => throw _privateConstructorUsedError;
  bool get shuffleModeEnabled => throw _privateConstructorUsedError;
  bool get loopModeEnabled => throw _privateConstructorUsedError;
  bool get canSkipToPrevious => throw _privateConstructorUsedError;
  bool get canSkipToNext => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AudioSequenceStateCopyWith<AudioSequenceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioSequenceStateCopyWith<$Res> {
  factory $AudioSequenceStateCopyWith(
          AudioSequenceState value, $Res Function(AudioSequenceState) then) =
      _$AudioSequenceStateCopyWithImpl<$Res, AudioSequenceState>;
  @useResult
  $Res call(
      {String currentTrackId,
      KtList<String> queue,
      bool shuffleModeEnabled,
      bool loopModeEnabled,
      bool canSkipToPrevious,
      bool canSkipToNext});
}

/// @nodoc
class _$AudioSequenceStateCopyWithImpl<$Res, $Val extends AudioSequenceState>
    implements $AudioSequenceStateCopyWith<$Res> {
  _$AudioSequenceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTrackId = null,
    Object? queue = null,
    Object? shuffleModeEnabled = null,
    Object? loopModeEnabled = null,
    Object? canSkipToPrevious = null,
    Object? canSkipToNext = null,
  }) {
    return _then(_value.copyWith(
      currentTrackId: null == currentTrackId
          ? _value.currentTrackId
          : currentTrackId // ignore: cast_nullable_to_non_nullable
              as String,
      queue: null == queue
          ? _value.queue
          : queue // ignore: cast_nullable_to_non_nullable
              as KtList<String>,
      shuffleModeEnabled: null == shuffleModeEnabled
          ? _value.shuffleModeEnabled
          : shuffleModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      loopModeEnabled: null == loopModeEnabled
          ? _value.loopModeEnabled
          : loopModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      canSkipToPrevious: null == canSkipToPrevious
          ? _value.canSkipToPrevious
          : canSkipToPrevious // ignore: cast_nullable_to_non_nullable
              as bool,
      canSkipToNext: null == canSkipToNext
          ? _value.canSkipToNext
          : canSkipToNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AudioSequenceStateCopyWith<$Res>
    implements $AudioSequenceStateCopyWith<$Res> {
  factory _$$_AudioSequenceStateCopyWith(_$_AudioSequenceState value,
          $Res Function(_$_AudioSequenceState) then) =
      __$$_AudioSequenceStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String currentTrackId,
      KtList<String> queue,
      bool shuffleModeEnabled,
      bool loopModeEnabled,
      bool canSkipToPrevious,
      bool canSkipToNext});
}

/// @nodoc
class __$$_AudioSequenceStateCopyWithImpl<$Res>
    extends _$AudioSequenceStateCopyWithImpl<$Res, _$_AudioSequenceState>
    implements _$$_AudioSequenceStateCopyWith<$Res> {
  __$$_AudioSequenceStateCopyWithImpl(
      _$_AudioSequenceState _value, $Res Function(_$_AudioSequenceState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentTrackId = null,
    Object? queue = null,
    Object? shuffleModeEnabled = null,
    Object? loopModeEnabled = null,
    Object? canSkipToPrevious = null,
    Object? canSkipToNext = null,
  }) {
    return _then(_$_AudioSequenceState(
      currentTrackId: null == currentTrackId
          ? _value.currentTrackId
          : currentTrackId // ignore: cast_nullable_to_non_nullable
              as String,
      queue: null == queue
          ? _value.queue
          : queue // ignore: cast_nullable_to_non_nullable
              as KtList<String>,
      shuffleModeEnabled: null == shuffleModeEnabled
          ? _value.shuffleModeEnabled
          : shuffleModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      loopModeEnabled: null == loopModeEnabled
          ? _value.loopModeEnabled
          : loopModeEnabled // ignore: cast_nullable_to_non_nullable
              as bool,
      canSkipToPrevious: null == canSkipToPrevious
          ? _value.canSkipToPrevious
          : canSkipToPrevious // ignore: cast_nullable_to_non_nullable
              as bool,
      canSkipToNext: null == canSkipToNext
          ? _value.canSkipToNext
          : canSkipToNext // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AudioSequenceState extends _AudioSequenceState {
  _$_AudioSequenceState(
      {required this.currentTrackId,
      required this.queue,
      required this.shuffleModeEnabled,
      required this.loopModeEnabled,
      required this.canSkipToPrevious,
      required this.canSkipToNext})
      : super._();

  @override
  final String currentTrackId;
  @override
  final KtList<String> queue;
  @override
  final bool shuffleModeEnabled;
  @override
  final bool loopModeEnabled;
  @override
  final bool canSkipToPrevious;
  @override
  final bool canSkipToNext;

  @override
  String toString() {
    return 'AudioSequenceState(currentTrackId: $currentTrackId, queue: $queue, shuffleModeEnabled: $shuffleModeEnabled, loopModeEnabled: $loopModeEnabled, canSkipToPrevious: $canSkipToPrevious, canSkipToNext: $canSkipToNext)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AudioSequenceState &&
            (identical(other.currentTrackId, currentTrackId) ||
                other.currentTrackId == currentTrackId) &&
            (identical(other.queue, queue) || other.queue == queue) &&
            (identical(other.shuffleModeEnabled, shuffleModeEnabled) ||
                other.shuffleModeEnabled == shuffleModeEnabled) &&
            (identical(other.loopModeEnabled, loopModeEnabled) ||
                other.loopModeEnabled == loopModeEnabled) &&
            (identical(other.canSkipToPrevious, canSkipToPrevious) ||
                other.canSkipToPrevious == canSkipToPrevious) &&
            (identical(other.canSkipToNext, canSkipToNext) ||
                other.canSkipToNext == canSkipToNext));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currentTrackId, queue,
      shuffleModeEnabled, loopModeEnabled, canSkipToPrevious, canSkipToNext);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AudioSequenceStateCopyWith<_$_AudioSequenceState> get copyWith =>
      __$$_AudioSequenceStateCopyWithImpl<_$_AudioSequenceState>(
          this, _$identity);
}

abstract class _AudioSequenceState extends AudioSequenceState {
  factory _AudioSequenceState(
      {required final String currentTrackId,
      required final KtList<String> queue,
      required final bool shuffleModeEnabled,
      required final bool loopModeEnabled,
      required final bool canSkipToPrevious,
      required final bool canSkipToNext}) = _$_AudioSequenceState;
  _AudioSequenceState._() : super._();

  @override
  String get currentTrackId;
  @override
  KtList<String> get queue;
  @override
  bool get shuffleModeEnabled;
  @override
  bool get loopModeEnabled;
  @override
  bool get canSkipToPrevious;
  @override
  bool get canSkipToNext;
  @override
  @JsonKey(ignore: true)
  _$$_AudioSequenceStateCopyWith<_$_AudioSequenceState> get copyWith =>
      throw _privateConstructorUsedError;
}
