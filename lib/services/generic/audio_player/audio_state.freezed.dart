// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AudioState {
  AudioCondition get condition => throw _privateConstructorUsedError;
  AudioPosition get position => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AudioStateCopyWith<AudioState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioStateCopyWith<$Res> {
  factory $AudioStateCopyWith(
          AudioState value, $Res Function(AudioState) then) =
      _$AudioStateCopyWithImpl<$Res, AudioState>;
  @useResult
  $Res call({AudioCondition condition, AudioPosition position});

  $AudioPositionCopyWith<$Res> get position;
}

/// @nodoc
class _$AudioStateCopyWithImpl<$Res, $Val extends AudioState>
    implements $AudioStateCopyWith<$Res> {
  _$AudioStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? condition = null,
    Object? position = null,
  }) {
    return _then(_value.copyWith(
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as AudioCondition,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as AudioPosition,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AudioPositionCopyWith<$Res> get position {
    return $AudioPositionCopyWith<$Res>(_value.position, (value) {
      return _then(_value.copyWith(position: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AudioStateCopyWith<$Res>
    implements $AudioStateCopyWith<$Res> {
  factory _$$_AudioStateCopyWith(
          _$_AudioState value, $Res Function(_$_AudioState) then) =
      __$$_AudioStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AudioCondition condition, AudioPosition position});

  @override
  $AudioPositionCopyWith<$Res> get position;
}

/// @nodoc
class __$$_AudioStateCopyWithImpl<$Res>
    extends _$AudioStateCopyWithImpl<$Res, _$_AudioState>
    implements _$$_AudioStateCopyWith<$Res> {
  __$$_AudioStateCopyWithImpl(
      _$_AudioState _value, $Res Function(_$_AudioState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? condition = null,
    Object? position = null,
  }) {
    return _then(_$_AudioState(
      condition: null == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as AudioCondition,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as AudioPosition,
    ));
  }
}

/// @nodoc

class _$_AudioState implements _AudioState {
  _$_AudioState({required this.condition, required this.position});

  @override
  final AudioCondition condition;
  @override
  final AudioPosition position;

  @override
  String toString() {
    return 'AudioState(condition: $condition, position: $position)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AudioState &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(runtimeType, condition, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AudioStateCopyWith<_$_AudioState> get copyWith =>
      __$$_AudioStateCopyWithImpl<_$_AudioState>(this, _$identity);
}

abstract class _AudioState implements AudioState {
  factory _AudioState(
      {required final AudioCondition condition,
      required final AudioPosition position}) = _$_AudioState;

  @override
  AudioCondition get condition;
  @override
  AudioPosition get position;
  @override
  @JsonKey(ignore: true)
  _$$_AudioStateCopyWith<_$_AudioState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AudioPosition {
  Duration get position => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AudioPositionCopyWith<AudioPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioPositionCopyWith<$Res> {
  factory $AudioPositionCopyWith(
          AudioPosition value, $Res Function(AudioPosition) then) =
      _$AudioPositionCopyWithImpl<$Res, AudioPosition>;
  @useResult
  $Res call({Duration position, Duration duration});
}

/// @nodoc
class _$AudioPositionCopyWithImpl<$Res, $Val extends AudioPosition>
    implements $AudioPositionCopyWith<$Res> {
  _$AudioPositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AudioPositionCopyWith<$Res>
    implements $AudioPositionCopyWith<$Res> {
  factory _$$_AudioPositionCopyWith(
          _$_AudioPosition value, $Res Function(_$_AudioPosition) then) =
      __$$_AudioPositionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration position, Duration duration});
}

/// @nodoc
class __$$_AudioPositionCopyWithImpl<$Res>
    extends _$AudioPositionCopyWithImpl<$Res, _$_AudioPosition>
    implements _$$_AudioPositionCopyWith<$Res> {
  __$$_AudioPositionCopyWithImpl(
      _$_AudioPosition _value, $Res Function(_$_AudioPosition) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
    Object? duration = null,
  }) {
    return _then(_$_AudioPosition(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$_AudioPosition implements _AudioPosition {
  _$_AudioPosition({required this.position, required this.duration});

  @override
  final Duration position;
  @override
  final Duration duration;

  @override
  String toString() {
    return 'AudioPosition(position: $position, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AudioPosition &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AudioPositionCopyWith<_$_AudioPosition> get copyWith =>
      __$$_AudioPositionCopyWithImpl<_$_AudioPosition>(this, _$identity);
}

abstract class _AudioPosition implements AudioPosition {
  factory _AudioPosition(
      {required final Duration position,
      required final Duration duration}) = _$_AudioPosition;

  @override
  Duration get position;
  @override
  Duration get duration;
  @override
  @JsonKey(ignore: true)
  _$$_AudioPositionCopyWith<_$_AudioPosition> get copyWith =>
      throw _privateConstructorUsedError;
}
