import 'package:flutter/material.dart';

extension ThemeExt on BuildContext {
  Color get primaryColor => Theme.of(this).primaryColor;

  Color get errorColor => Theme.of(this).errorColor;

  TextTheme get textTheme => Theme.of(this).textTheme;
}

extension MediaQueryExt on BuildContext {
  Size get mediaQuerySize => MediaQuery.of(this).size;

  bool get alwaysUse24HourFormat => MediaQuery.of(this).alwaysUse24HourFormat;
}

extension ScaffoldExt on BuildContext {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
          SnackBar snackbar) =>
      ScaffoldMessenger.of(this).showSnackBar(snackbar);
}

extension NavigatorExt on BuildContext {
  Future<T?> push<T>(Route<T> route) => Navigator.push(this, route);

  void pop<T extends Object>([T? result]) => Navigator.pop(this, result);

  Future<Object?> pushNamed<T>(String routeName, {Object? arguments}) =>
      Navigator.pushNamed(this, routeName, arguments: arguments);

  Future<Object?> pushNamedAndRemoveUntil<T>(
          String routeName, RoutePredicate predicate, {Object? arguments}) =>
      Navigator.pushNamedAndRemoveUntil(this, routeName, predicate,
          arguments: arguments);

  Future<Object?> pushReplacementNamed<T>(String routeName,
          {Object? arguments}) =>
      Navigator.pushReplacementNamed(this, routeName, arguments: arguments);

  bool canPop() => Navigator.canPop(this);

  void popUntil(RoutePredicate predicate) =>
      Navigator.popUntil(this, predicate);
}

extension FocusScopeExt on BuildContext {
  FocusScopeNode get focusScope => FocusScope.of(this);
}
