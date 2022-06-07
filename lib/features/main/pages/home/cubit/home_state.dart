import 'package:archiman/features/common/utils/generic/refresh_state.dart';
import 'package:archiman/features/main/models/stack_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    required RefreshState refreshState,
    required KtList<StackUser> stackUsers,
  }) = _HomeState;

  factory HomeState.initial() {
    return HomeState(
      refreshState: RefreshState.inProgress(),
      stackUsers: KtList.empty(),
    );
  }
}
