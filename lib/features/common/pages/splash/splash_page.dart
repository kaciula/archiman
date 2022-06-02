import 'package:archiman/features/common/widgets/templates/refresh_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

import 'cubit/splash_cubit.dart';
import 'cubit/splash_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const String routeName = 'Splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, SplashState state) {
    _logger.info('rebuild state=$state');
    return Scaffold(
      body: _body(context, state),
    );
  }

  Widget _body(BuildContext context, SplashState state) {
    return RefreshContainer(
      refreshState: state.refreshState,
      content: () => Container(),
      onRetry: () => _cubit.refreshRequested(),
    );
  }

  // ignore: unused_element
  SplashCubit get _cubit => context.read<SplashCubit>();
}

// ignore: unused_element
final Logger _logger = Logger('SplashPage');
