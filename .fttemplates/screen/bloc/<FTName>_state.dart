import 'package:<AppName>/screens/<FTName | snakecase>/bloc/<FTName | snakecase>_effect.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '<FTName | snakecase>_state.freezed.dart';

@freezed
class <FTName | pascalcase>State with  _$<FTName | pascalcase>State {
  factory <FTName | pascalcase>State({<FTName | pascalcase>Effect? effect,}) = _<FTName | pascalcase>State;

  factory <FTName | pascalcase>State.initial() {
    return <FTName | pascalcase>State();
  }

  static bool buildWhen(<FTName | pascalcase>State previous, <FTName | pascalcase>State current) {
    return previous != current && previous.effect == current.effect;
  }

  static bool listenWhen(<FTName | pascalcase>State previous, <FTName | pascalcase>State current) {
    return current.effect != null;
  }
}