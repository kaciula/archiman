import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

import 'cubit/<FTName | snakecase>_cubit.dart';
import 'cubit/<FTName | snakecase>_effect.dart';
import 'cubit/<FTName | snakecase>_state.dart';

class <FTName | pascalcase>Page extends StatefulWidget {
  const <FTName | pascalcase>Page({Key? key}) : super(key: key);

  static const String routeName = '<FTName | pascalcase>';

  @override
  State<<FTName | pascalcase>Page> createState() => _<FTName | pascalcase>PageState();
}

class _<FTName | pascalcase>PageState extends State<<FTName | pascalcase>Page> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<<FTName | pascalcase>Cubit, <FTName | pascalcase>State>(
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
      body: BlocListener<<FTName | pascalcase>Cubit, <FTName | pascalcase>State>(
        listenWhen: <FTName | pascalcase>State.listenWhen,
        listener: _effectListener,
        child: SafeArea(
          child: _body(context, state),
        ),
      ),
    );
  }

  Widget _body(BuildContext context, <FTName | pascalcase>State state) {
    return Container();
  }

  // ignore: unused_element
  <FTName | pascalcase>Cubit get _cubit => context.read<<FTName | pascalcase>Cubit>();
}

// ignore: unused_element
final Logger _logger = Logger('<FTName | pascalcase>Page');
