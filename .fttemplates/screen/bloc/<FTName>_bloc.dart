import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:<AppName>/screens/<FTName | snakecase>/bloc/<FTName | snakecase>_effect.dart';
import 'package:<AppName>/screens/<FTName | snakecase>/bloc/<FTName | snakecase>_event.dart';
import 'package:<AppName>/screens/<FTName | snakecase>/bloc/<FTName | snakecase>_state.dart';

class <FTName | pascalcase>Bloc extends Bloc<<FTName | pascalcase>Event, <FTName | pascalcase>State> {
  <FTName | pascalcase>Bloc() : super(<FTName | pascalcase>State.initial());

  @override
  Stream<<FTName | pascalcase>State> mapEventToState(<FTName | pascalcase>Event event) async* {
  
  }

  // ignore: unused_element
  Stream<<FTName | pascalcase>State> _withEffect(
        <FTName | pascalcase>State state, <FTName | pascalcase>Effect effect) async* {
      yield state.copyWith(effect: effect);
      yield state.copyWith(effect: null);
    }
}

// ignore: unused_element
final Logger _logger = Logger('<FTName | pascalcase>Bloc');