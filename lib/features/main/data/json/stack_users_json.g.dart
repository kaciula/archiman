// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stack_users_json.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StackUsersJson _$StackUsersJsonFromJson(Map<String, dynamic> json) =>
    StackUsersJson()
      ..items = (json['items'] as List<dynamic>)
          .map((e) => StackUserJson.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$StackUsersJsonToJson(StackUsersJson instance) =>
    <String, dynamic>{
      'items': instance.items,
    };
