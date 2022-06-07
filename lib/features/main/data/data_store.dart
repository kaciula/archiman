import 'package:archiman/features/main/models/stack_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

part 'data_store.freezed.dart';

abstract class DataStore {
  Future<StackUsersResult> getStackUsers();
}

@freezed
class StackUsersResult with _$StackUsersResult {
  factory StackUsersResult.success({required KtList<StackUser> stackUsers}) =
      StackUsersSuccess;

  factory StackUsersResult.failure({
    String? errorMsg,
    String? errorDetails,
  }) = StackUsersFailure;
}
