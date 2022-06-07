import 'package:archiman/features/main/models/stack_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_details_state.freezed.dart';

@freezed
class UserDetailsState with _$UserDetailsState {
  factory UserDetailsState({
    required StackUser user,
  }) = _UserDetailsState;

  factory UserDetailsState.initial(StackUser user) {
    return UserDetailsState(
      user: user,
    );
  }
}
