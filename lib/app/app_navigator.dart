import 'package:flutter/material.dart';

class AppNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  get context => navigatorKey.currentContext;

  // Common
  Future<void> goBack() async {
    navigatorKey.currentState!.pop();
  }

  Future<void> sendBack(dynamic result) async {
    navigatorKey.currentState!.pop(result);
  }
  // ---
}
