import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:kt_dart/kt.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

import 'audio_playlist.dart';
import 'audio_sequence_state.dart';
import 'audio_state.dart';
import 'audio_track.dart';

class AudioPlayerService {
  final AudioPlayer _player = AudioPlayer();

  ConcatenatingAudioSource? _playerPlaylist;

  Future<void> init({
    required String androidNotificationChannelId,
    required String androidNotificationChannelName,
  }) async {
    await JustAudioBackground.init(
      androidNotificationChannelId: androidNotificationChannelId,
      androidNotificationChannelName: androidNotificationChannelName,
      androidNotificationOngoing: true,
    );
  }

  Future<void> loadPlaylist(AudioPlaylist playlist) async {
    try {
      _playerPlaylist = ConcatenatingAudioSource(
        useLazyPreparation: true,
        shuffleOrder: DefaultShuffleOrder(),
        children: playlist.tracks
            .map<AudioSource>((it) => _buildAudioSource(it))
            .asList(),
      );
      await _player.setAudioSource(_playerPlaylist!,
          initialIndex: 0, initialPosition: Duration.zero);
    } catch (e) {
      _logger.warning('Error loading audio source for playlist : $e');
    }
  }

  UriAudioSource _buildAudioSource(AudioTrack track) {
    return AudioSource.uri(
      Uri.parse(track.audioUrl),
      tag: _buildTag(track),
    );
  }

  MediaItem _buildTag(AudioTrack track) {
    return MediaItem(
      id: track.id,
      title: track.songName,
      album: track.albumName,
      artist: track.artistName,
      artUri: Uri.parse(track.albumImageUrl),
      extras: {'trackId': track.id},
    );
  }

  Future<void> play() async {
    await _player.play();
  }

  Future<void> pause() async {
    await _player.pause();
  }

  Future<void> seekToStart() async {
    await _player.seek(Duration.zero);
  }

  Future<void> seekToNext() async {
    await _player.seekToNext();
  }

  Future<void> seekToPrevious() async {
    await _player.seekToPrevious();
  }

  void seek(Duration position) async {
    await _player.seek(position);
  }

  Future<void> setShuffleMode(bool enabled) async {
    if (enabled) {
      _player.shuffle();
    }
    _player.setShuffleModeEnabled(enabled);
  }

  Future<void> setLoopMode(bool enabled) async {
    await _player.setLoopMode(enabled ? LoopMode.one : LoopMode.off);
  }

  Future<void> updatePlaylistOrder(
      {required int currentIndex, required newIndex}) async {
    await _playerPlaylist?.move(currentIndex, newIndex);
  }

  Stream<AudioState> audioStateStream() {
    return Rx.combineLatest2<AudioCondition, AudioPosition, AudioState>(
      audioConditionStream(),
      audioPositionStream(),
      (AudioCondition condition, AudioPosition position) {
        return AudioState(condition: condition, position: position);
      },
    );
  }

  Stream<AudioCondition> audioConditionStream() {
    return _player.playerStateStream.map(
      (PlayerState playerState) {
        final ProcessingState processingState = playerState.processingState;
        final bool playing = playerState.playing;
        if (processingState == ProcessingState.loading ||
            processingState == ProcessingState.buffering) {
          return AudioCondition.loading;
        } else if (playing != true) {
          return AudioCondition.paused;
        } else if (processingState != ProcessingState.completed) {
          return AudioCondition.playing;
        } else {
          return AudioCondition.done;
        }
      },
    );
  }

  Stream<AudioPosition> audioPositionStream() {
    return Rx.combineLatest2<Duration, Duration?, AudioPosition>(
      _player.positionStream,
      _player.durationStream,
      (Duration position, Duration? duration) {
        return AudioPosition(
          position: position,
          duration: duration ?? Duration.zero,
        );
      },
    );
  }

  Stream<AudioSequenceState> audioSequenceStateStream() {
    return _player.sequenceStateStream.mapNotNull(
      (SequenceState? sequenceState) {
        if (sequenceState != null) {
          final List<IndexedAudioSource> effectiveSequence =
              sequenceState.effectiveSequence;
          final IndexedAudioSource? currentItem = sequenceState.currentSource;
          final String? currentTrackId =
              currentItem != null ? _trackIdFromAudioSource(currentItem) : null;

          if (currentTrackId != null) {
            return AudioSequenceState(
              currentTrackId: currentTrackId,
              queue: effectiveSequence
                  .map((IndexedAudioSource it) => _trackIdFromAudioSource(it))
                  .toImmutableList(),
              shuffleModeEnabled: sequenceState.shuffleModeEnabled,
              loopModeEnabled: sequenceState.loopMode != LoopMode.off,
              canSkipToPrevious: effectiveSequence.isNotEmpty &&
                  currentItem != null &&
                  effectiveSequence.first != currentItem,
              canSkipToNext: effectiveSequence.isNotEmpty &&
                  currentItem != null &&
                  effectiveSequence.last != currentItem,
            );
          }
        }
        return null;
      },
    );
  }

  String _trackIdFromAudioSource(IndexedAudioSource audioSource) {
    final MediaItem mediaItem = audioSource.tag as MediaItem;
    return mediaItem.extras!['trackId'];
  }

  Future<void> dispose() async {
    await _player.dispose();
  }
}

// ignore: unused_element
final Logger _logger = Logger('AudioPlayerService');
