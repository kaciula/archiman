import 'package:archiman/features/common/utils/generic/refresh_state.dart';
import 'package:archiman/features/main/data/data_store.dart';
import 'package:archiman/features/main/models/stack_user.dart';
import 'package:archiman/features/main/pages/home/home_page.dart';
import 'package:archiman/start/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/kt.dart';
import 'package:logging/logging.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(HomeArgs args) : super(HomeState.initial());

  final DataStore _dataStore = getIt<DataStore>();

  Future<void> pageStarted() async {
    await _refresh();
  }

  void refreshRequested() async {
    await _refresh();
  }

  Future<void> _refresh() async {
    emit(state.copyWith(refreshState: RefreshState.inProgress()));

    final StackUsersResult result = await _dataStore.getStackUsers();
    result.when(
      success: (KtList<StackUser> stackUsers) {
        emit(
          state.copyWith(
            stackUsers: stackUsers,
            refreshState: RefreshState.success(),
          ),
        );
      },
      failure: (String? errorMsg, String? errorDetails) {
        emit(
          state.copyWith(
            refreshState: RefreshState.error(
              errorMsg: errorMsg,
              errorDetails: errorDetails,
            ),
          ),
        );
      },
    );
  }
}

// ignore: unused_element
final Logger _logger = Logger('HomeCubit');
