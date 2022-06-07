import 'package:archiman/features/main/pages/home/cubit/home_cubit.dart';
import 'package:archiman/features/main/pages/home/home_page.dart';
import 'package:archiman/features/main/pages/user_details/cubit/user_details_cubit.dart';
import 'package:archiman/features/main/pages/user_details/user_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/app_cubit.dart';

Route<dynamic> appRoutes(RouteSettings settings, AppCubit appCubit) {
  if (settings.name == HomePage.routeName) {
    final HomeArgs args = settings.arguments as HomeArgs;
    return MaterialPageRoute<Object>(
      builder: (BuildContext context) {
        return BlocProvider<HomeCubit>(
          create: (BuildContext context) => HomeCubit(args)..pageStarted(),
          child: HomePage(),
        );
      },
    );
  }
  if (settings.name == UserDetailsPage.routeName) {
    final UserDetailsArgs args = settings.arguments as UserDetailsArgs;
    return MaterialPageRoute<Object>(
      builder: (BuildContext context) {
        return BlocProvider<UserDetailsCubit>(
          create: (BuildContext context) => UserDetailsCubit(args),
          child: UserDetailsPage(),
        );
      },
    );
  }

  throw Exception('Unknown route [${settings.name}]');
}
