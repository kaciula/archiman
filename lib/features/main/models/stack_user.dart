import 'package:freezed_annotation/freezed_annotation.dart';

part 'stack_user.freezed.dart';

@freezed
class StackUser with _$StackUser {
  factory StackUser({
    required int accountId,
    required String name,
  }) = _StackUser;
}
