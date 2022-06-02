import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_state.freezed.dart';

@freezed
class RefreshState with _$RefreshState {
  factory RefreshState.inProgress() = InProgress;

  factory RefreshState.success() = Success;

  factory RefreshState.error({String? errorMsg, String? errorDetails}) = Error;
}
