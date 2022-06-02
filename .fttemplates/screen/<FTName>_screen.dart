import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:<AppName>/screens/<FTName | snakecase>/bloc/<FTName | snakecase>_bloc.dart';
import 'package:<AppName>/screens/<FTName | snakecase>/bloc/<FTName | snakecase>_effect.dart';
import 'package:<AppName>/screens/<FTName | snakecase>/bloc/<FTName | snakecase>_state.dart';

class <FTName | pascalcase>Screen extends StatefulWidget {
  static const String routeName = '<FTName | pascalcase>';

  @override
  State<<FTName | pascalcase>Screen> createState() => _<FTName | pascalcase>ScreenState();
}

class _<FTName | pascalcase>ScreenState extends State<<FTName | pascalcase>Screen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<<FTName | pascalcase>Bloc, <FTName | pascalcase>State>(
        bloc: _bloc(context),
        buildWhen: <FTName | pascalcase>State.buildWhen,
        builder: _builder,
    );
  }

  void _effectListener(BuildContext context, <FTName | pascalcase>State state) {
    final <FTName | pascalcase>Effect effect = state.effect!;
    _logger.info('effect=$effect');
  }

  Widget _builder(BuildContext context, <FTName | pascalcase>State state) {
    _logger.info('rebuild state=$state');
    return Scaffold(
      body: BlocListener<<FTName | pascalcase>Bloc, <FTName | pascalcase>State>(
        bloc: _bloc(context),
        listenWhen: <FTName | pascalcase>State.listenWhen,
        listener: _effectListener,
        child: _body(context, state),
      ),
    );
  }

  Widget _body(BuildContext context, <FTName | pascalcase>State state) {
    return Container();
  }

  <FTName | pascalcase>Bloc _bloc(BuildContext context) {
    return BlocProvider.of<<FTName | pascalcase>Bloc>(context);
  }
}

// ignore: unused_element
final Logger _logger = Logger('<FTName | pascalcase>Screen');
