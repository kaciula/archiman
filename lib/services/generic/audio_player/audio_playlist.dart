import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

import 'audio_track.dart';

part 'audio_playlist.freezed.dart';

@freezed
class AudioPlaylist with _$AudioPlaylist {
  factory AudioPlaylist({
    required KtList<AudioTrack> tracks,
  }) = _AudioPlaylist;
}
