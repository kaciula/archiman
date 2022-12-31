import 'package:json_annotation/json_annotation.dart';

part 'synthesize_text_request.g.dart';

@JsonSerializable()
class SynthesizeTextRequest {
  SynthesizeTextRequest(
      {required this.input, required this.voice, required this.audioConfig});

  factory SynthesizeTextRequest.fromJson(Map<String, dynamic> json) =>
      _$SynthesizeTextRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SynthesizeTextRequestToJson(this);

  late InputRequest input;
  late VoiceRequest voice;
  late AudioConfigRequest audioConfig;
}

@JsonSerializable()
class InputRequest {
  InputRequest(this.text);

  factory InputRequest.fromJson(Map<String, dynamic> json) =>
      _$InputRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InputRequestToJson(this);

  String text;
}

@JsonSerializable()
class VoiceRequest {
  VoiceRequest(this.name, this.languageCode);

  factory VoiceRequest.fromJson(Map<String, dynamic> json) =>
      _$VoiceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VoiceRequestToJson(this);

  String name;
  String languageCode;
}

@JsonSerializable()
class AudioConfigRequest {
  AudioConfigRequest(this.audioEncoding);

  factory AudioConfigRequest.fromJson(Map<String, dynamic> json) =>
      _$AudioConfigRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AudioConfigRequestToJson(this);

  String audioEncoding;
}
