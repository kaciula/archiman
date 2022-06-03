import 'package:archiman/app/resources/resources.dart';
import 'package:archiman/features/common/widgets/molecules/universal_animation.dart';
import 'package:archiman/features/common/widgets/molecules/universal_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

import 'cubit/home_cubit.dart';
import 'cubit/home_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String routeName = 'Home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: _builder,
    );
  }

  Widget _builder(BuildContext context, HomeState state) {
    _logger.info('rebuild state=$state');
    return Scaffold(
      body: _body(context, state),
    );
  }

  Widget _body(BuildContext context, HomeState state) {
    return SafeArea(
      child: Column(
        children: const [
          Expanded(
            child: UniversalImage(Images.sampleImage),
          ),
          Expanded(
            child: UniversalImage(Svgs.sampleSvg),
          ),
          Expanded(
            child: UniversalAnimation(
              url: Animations.sampleAnimation,
            ),
          ),
        ],
      ),
    );
  }

  // ignore: unused_element
  HomeCubit get _cubit => context.read<HomeCubit>();
}

class HomeArgs {}

// ignore: unused_element
final Logger _logger = Logger('HomePage');
