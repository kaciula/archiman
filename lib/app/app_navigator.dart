import 'package:archiman/features/common/pages/web_page/web_page.dart';
import 'package:archiman/features/main/pages/home/home_page.dart';
import 'package:archiman/features/main/pages/user_details/user_details_page.dart';
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

  Future<void> goToWebPage(WebPageArgs args) async {
    navigatorKey.currentState!.pushNamed(WebPage.routeName, arguments: args);
  }
  // ---

  Future<void> moveToHome(HomeArgs args) async {
    navigatorKey.currentState!.pushNamedAndRemoveUntil(
      HomePage.routeName,
      (Route<dynamic> _) => false,
      arguments: args,
    );
  }

  void goToUserDetails(UserDetailsArgs args) {
    navigatorKey.currentState!
        .pushNamed(UserDetailsPage.routeName, arguments: args);
  }
}
