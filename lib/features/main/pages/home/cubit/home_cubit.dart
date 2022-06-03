import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());
}

// ignore: unused_element
final Logger _logger = Logger('HomeCubit');
