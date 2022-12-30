// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_playlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AudioPlaylist {
  KtList<AudioTrack> get tracks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AudioPlaylistCopyWith<AudioPlaylist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioPlaylistCopyWith<$Res> {
  factory $AudioPlaylistCopyWith(
          AudioPlaylist value, $Res Function(AudioPlaylist) then) =
      _$AudioPlaylistCopyWithImpl<$Res, AudioPlaylist>;
  @useResult
  $Res call({KtList<AudioTrack> tracks});
}

/// @nodoc
class _$AudioPlaylistCopyWithImpl<$Res, $Val extends AudioPlaylist>
    implements $AudioPlaylistCopyWith<$Res> {
  _$AudioPlaylistCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tracks = null,
  }) {
    return _then(_value.copyWith(
      tracks: null == tracks
          ? _value.tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as KtList<AudioTrack>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AudioPlaylistCopyWith<$Res>
    implements $AudioPlaylistCopyWith<$Res> {
  factory _$$_AudioPlaylistCopyWith(
          _$_AudioPlaylist value, $Res Function(_$_AudioPlaylist) then) =
      __$$_AudioPlaylistCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({KtList<AudioTrack> tracks});
}

/// @nodoc
class __$$_AudioPlaylistCopyWithImpl<$Res>
    extends _$AudioPlaylistCopyWithImpl<$Res, _$_AudioPlaylist>
    implements _$$_AudioPlaylistCopyWith<$Res> {
  __$$_AudioPlaylistCopyWithImpl(
      _$_AudioPlaylist _value, $Res Function(_$_AudioPlaylist) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tracks = null,
  }) {
    return _then(_$_AudioPlaylist(
      tracks: null == tracks
          ? _value.tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as KtList<AudioTrack>,
    ));
  }
}

/// @nodoc

class _$_AudioPlaylist implements _AudioPlaylist {
  _$_AudioPlaylist({required this.tracks});

  @override
  final KtList<AudioTrack> tracks;

  @override
  String toString() {
    return 'AudioPlaylist(tracks: $tracks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AudioPlaylist &&
            (identical(other.tracks, tracks) || other.tracks == tracks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tracks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AudioPlaylistCopyWith<_$_AudioPlaylist> get copyWith =>
      __$$_AudioPlaylistCopyWithImpl<_$_AudioPlaylist>(this, _$identity);
}

abstract class _AudioPlaylist implements AudioPlaylist {
  factory _AudioPlaylist({required final KtList<AudioTrack> tracks}) =
      _$_AudioPlaylist;

  @override
  KtList<AudioTrack> get tracks;
  @override
  @JsonKey(ignore: true)
  _$$_AudioPlaylistCopyWith<_$_AudioPlaylist> get copyWith =>
      throw _privateConstructorUsedError;
}
