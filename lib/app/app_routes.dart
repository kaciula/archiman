import 'package:flutter/material.dart';

import 'cubit/app_cubit.dart';

Route<dynamic> appRoutes(RouteSettings settings, AppCubit appCubit) {
  throw Exception('Unknown route [${settings.name}]');
}
