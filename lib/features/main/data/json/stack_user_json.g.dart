// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stack_user_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StackUserJson _$StackUserJsonFromJson(Map<String, dynamic> json) =>
    StackUserJson()
      ..accountId = json['account_id'] as int
      ..displayName = json['display_name'] as String;

Map<String, dynamic> _$StackUserJsonToJson(StackUserJson instance) =>
    <String, dynamic>{
      'account_id': instance.accountId,
      'display_name': instance.displayName,
    };
