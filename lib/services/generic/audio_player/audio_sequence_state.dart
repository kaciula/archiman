import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

import 'audio_playlist.dart';

part 'audio_sequence_state.freezed.dart';

@freezed
class AudioSequenceState with _$AudioSequenceState {
  factory AudioSequenceState({
    required String currentTrackId,
    required KtList<String> queue,
    required bool shuffleModeEnabled,
    required bool loopModeEnabled,
    required bool canSkipToPrevious,
    required bool canSkipToNext,
  }) = _AudioSequenceState;

  AudioSequenceState._();

  factory AudioSequenceState.initial(AudioPlaylist playlist) =>
      AudioSequenceState(
        currentTrackId: playlist.tracks.first().id,
        queue: playlist.tracks.map((it) => it.id),
        shuffleModeEnabled: false,
        loopModeEnabled: false,
        canSkipToPrevious: false,
        canSkipToNext: false,
      );

  late final KtList<String> remainingQueue =
      queue.subList(queue.indexOf(currentTrackId), queue.lastIndex + 1);
}
