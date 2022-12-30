import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_track.freezed.dart';

@freezed
class AudioTrack with _$AudioTrack {
  factory AudioTrack({
    required String id,
    required String songName,
    required String albumName,
    required String artistName,
    required String albumImageUrl,
    required String audioUrl,
  }) = _AudioTrack;
}
