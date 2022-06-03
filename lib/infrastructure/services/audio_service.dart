import 'dart:async';
import 'dart:ui';

import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';
import 'package:logging/logging.dart';
import 'package:universal_io/io.dart';

class AudioService {
  final AudioPlayer _player = AudioPlayer();
  late final AudioSession _audioSession;

  StreamSubscription<ProcessingState>? _playerStateSub;
  bool _isPaused = false;

  Future<void> init() async {
    _audioSession = await AudioSession.instance;
    await _audioSession.configure(
      const AudioSessionConfiguration.speech().copyWith(
        androidWillPauseWhenDucked: false,
        androidAudioFocusGainType:
            AndroidAudioFocusGainType.gainTransientMayDuck,
      ),
    );
    _handleInterruptions(_audioSession);
  }

  Future<void> play({
    File? file,
    String? url,
    VoidCallback? onCompleted,
  }) async {
    assert(file != null || url != null);
    if (!_isPaused) {
      _cancelSub();
      if (file != null) {
        await _player.setFilePath(file.path);
      } else if (url != null) {
        if (url.startsWith('assets')) {
          await _player.setAsset(url);
        } else {
          await _player.setUrl(url);
        }
      }
      _playerStateSub = _player.processingStateStream.listen(
        (ProcessingState processingState) {
          if (processingState == ProcessingState.completed) {
            _cancelSub();
            _audioSession.setActive(false);
            onCompleted?.call();
          }
        },
      );
    }
    await _player.play();
  }

  bool isActive() {
    final ProcessingState processingState = _player.playerState.processingState;
    return processingState != ProcessingState.idle &&
        processingState != ProcessingState.completed;
  }

  Future<void> playAnyway() async {
    await _player.play();
  }

  Future<void> seekBehindAndPlay(Duration duration) async {
    final Duration currentDuration = _player.position;
    duration = currentDuration < duration
        ? Duration(seconds: 0)
        : currentDuration - duration;
    await _player.seek(duration);
    await _player.play();
  }

  Future<void> pause() async {
    _isPaused = true;
    await _player.pause();
  }

  Future<void> stop() async {
    _isPaused = false;
    await _player.stop();
  }

  void _cancelSub() {
    _playerStateSub?.cancel();
    _playerStateSub = null;
    _isPaused = false;
  }

  void _handleInterruptions(AudioSession audioSession) {
    bool playInterrupted = false;
    audioSession.becomingNoisyEventStream.listen((_) {
      _logger.fine('noisy event pause');
      pause();
    });
    audioSession.interruptionEventStream.listen((AudioInterruptionEvent event) {
      _logger.fine('interruption begin: ${event.begin}');
      _logger.fine('interruption type: ${event.type}');
      if (event.begin) {
        switch (event.type) {
          case AudioInterruptionType.duck:
          case AudioInterruptionType.pause:
          case AudioInterruptionType.unknown:
            pause();
            playInterrupted = true;
            break;
        }
      } else {
        switch (event.type) {
          case AudioInterruptionType.duck:
          case AudioInterruptionType.pause:
          case AudioInterruptionType.unknown:
            if (playInterrupted) {
              playAnyway();
            }
            playInterrupted = false;
            break;
        }
      }
    });
  }
}

// ignore: unused_element
final Logger _logger = Logger('AudioService');
