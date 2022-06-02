import 'package:freezed_annotation/freezed_annotation.dart';

part '<FTName | snakecase>_state.freezed.dart';

@freezed
class <FTName | pascalcase>State with  _$<FTName | pascalcase>State {
  factory <FTName | pascalcase>State() = _<FTName | pascalcase>State;

  factory <FTName | pascalcase>State.initial() {
    return <FTName | pascalcase>State();
  }
}