import 'package:archiman/features/main/models/stack_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stack_user_json.g.dart';

@JsonSerializable()
class StackUserJson {
  StackUserJson();

  factory StackUserJson.fromJson(Map<String, dynamic> json) =>
      _$StackUserJsonFromJson(json);

  @JsonKey(name: 'account_id')
  late int accountId;
  @JsonKey(name: 'display_name')
  late String displayName;

  StackUser map() {
    return StackUser(
      accountId: accountId,
      name: displayName,
    );
  }
}
