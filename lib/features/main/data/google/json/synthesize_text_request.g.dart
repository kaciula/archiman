// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'synthesize_text_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SynthesizeTextRequest _$SynthesizeTextRequestFromJson(
        Map<String, dynamic> json) =>
    SynthesizeTextRequest(
      input: InputRequest.fromJson(json['input'] as Map<String, dynamic>),
      voice: VoiceRequest.fromJson(json['voice'] as Map<String, dynamic>),
      audioConfig: AudioConfigRequest.fromJson(
          json['audioConfig'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SynthesizeTextRequestToJson(
        SynthesizeTextRequest instance) =>
    <String, dynamic>{
      'input': instance.input,
      'voice': instance.voice,
      'audioConfig': instance.audioConfig,
    };

InputRequest _$InputRequestFromJson(Map<String, dynamic> json) => InputRequest(
      json['text'] as String,
    );

Map<String, dynamic> _$InputRequestToJson(InputRequest instance) =>
    <String, dynamic>{
      'text': instance.text,
    };

VoiceRequest _$VoiceRequestFromJson(Map<String, dynamic> json) => VoiceRequest(
      json['name'] as String,
      json['languageCode'] as String,
    );

Map<String, dynamic> _$VoiceRequestToJson(VoiceRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'languageCode': instance.languageCode,
    };

AudioConfigRequest _$AudioConfigRequestFromJson(Map<String, dynamic> json) =>
    AudioConfigRequest(
      json['audioEncoding'] as String,
    );

Map<String, dynamic> _$AudioConfigRequestToJson(AudioConfigRequest instance) =>
    <String, dynamic>{
      'audioEncoding': instance.audioEncoding,
    };
