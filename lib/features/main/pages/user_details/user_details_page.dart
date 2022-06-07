import 'package:archiman/app/app_strings.al.dart';
import 'package:archiman/features/main/models/stack_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

import 'cubit/user_details_cubit.dart';
import 'cubit/user_details_state.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({Key? key}) : super(key: key);

  static const String routeName = 'UserDetails';

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsCubit, UserDetailsState>(
      builder: _builder,
      buildWhen: (UserDetailsState previous, UserDetailsState current) =>
          previous != current,
    );
  }

  Widget _builder(BuildContext context, UserDetailsState state) {
    _logger.info('rebuild state=$state');
    return Scaffold(
      body: _body(context, state),
    );
  }

  Widget _body(BuildContext context, UserDetailsState state) {
    return SafeArea(
      child: Center(
        child: Text(Strings.selectedUserIs.get(state.user.name)),
      ),
    );
  }

  // ignore: unused_element
  UserDetailsCubit get _cubit => context.read<UserDetailsCubit>();
}

class UserDetailsArgs {
  UserDetailsArgs(this.user);

  final StackUser user;
}

// ignore: unused_element
final Logger _logger = Logger('UserDetailsPage');
