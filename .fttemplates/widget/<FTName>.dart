import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

import '<FTName | snakecase>_cubit.dart';
import '<FTName | snakecase>_state.dart';

class <FTName | pascalcase> extends StatefulWidget {
  const <FTName | pascalcase>({Key? key, this.controller}) : super(key: key);

  final <FTName | pascalcase>Controller? controller;

  @override
  State<<FTName | pascalcase>> createState() => _<FTName | pascalcase>State();
}

class _<FTName | pascalcase>State extends State<<FTName | pascalcase>> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<<FTName | pascalcase>Cubit>(
      create: (BuildContext context) {
        final <FTName | pascalcase>Cubit cubit = <FTName | pascalcase>Cubit();
        widget.controller?.setCubit(cubit);
        return cubit;
      },
      child: Builder(
          builder: (BuildContext context) => BlocBuilder<<FTName | pascalcase>Cubit, <FTName | pascalcase>State>(
          builder: _builder,
          buildWhen: (<FTName | pascalcase>State previous, <FTName | pascalcase>State current) => previous != current,
        ),
      ),
    );
  }

  Widget _builder(BuildContext context, <FTName | pascalcase>State state) {
    _logger.info('rebuild state=$state');
    return Container();
  }

  // ignore: unused_element
  <FTName | pascalcase>Cubit _cubit(BuildContext context) => context.read<<FTName | pascalcase>Cubit>();
}

class <FTName | pascalcase>Controller {
  late final <FTName | pascalcase>Cubit _cubit;

  void setCubit(<FTName | pascalcase>Cubit cubit) {
    _cubit = cubit;
  }
}

// ignore: unused_element
final Logger _logger = Logger('<FTName | pascalcase>');
