import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_state.freezed.dart';

@freezed
class AudioState with _$AudioState {
  factory AudioState({
    required AudioCondition condition,
    required AudioPosition position,
  }) = _AudioState;

  factory AudioState.initial() => AudioState(
        condition: AudioCondition.paused,
        position:
            AudioPosition(position: Duration.zero, duration: Duration.zero),
      );
}

@freezed
class AudioPosition with _$AudioPosition {
  factory AudioPosition({
    required Duration position,
    required Duration duration,
  }) = _AudioPosition;
}

enum AudioCondition { loading, playing, paused, done }
