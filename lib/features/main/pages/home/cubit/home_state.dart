import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState() = _HomeState;

  factory HomeState.initial() {
    return HomeState();
  }
}
