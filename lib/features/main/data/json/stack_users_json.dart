import 'package:archiman/features/main/models/stack_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

import 'stack_user_json.dart';

part 'stack_users_json.g.dart';

@JsonSerializable()
class StackUsersJson {
  StackUsersJson();

  factory StackUsersJson.fromJson(Map<String, dynamic> json) =>
      _$StackUsersJsonFromJson(json);

  late List<StackUserJson> items;

  KtList<StackUser> map() {
    return items.map((StackUserJson it) => it.map()).toImmutableList();
  }
}
