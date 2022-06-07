import 'dart:math';

import 'package:archiman/features/main/data/data_store.dart';
import 'package:kt_dart/kt.dart';

class MockDataStore extends DataStore {
  final Random _random = Random();

  @override
  Future<StackUsersResult> getStackUsers() async {
    await _randomWaiting();
    return StackUsersSuccess(
      stackUsers: KtList.of(),
    );
  }

  Future<void> _randomWaiting() async {
    await Future.delayed(Duration(milliseconds: 400 + _random.nextInt(1000)));
  }
}
