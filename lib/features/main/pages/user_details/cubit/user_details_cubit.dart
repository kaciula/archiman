import 'package:archiman/features/main/pages/user_details/user_details_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';

import 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit(UserDetailsArgs args)
      : super(UserDetailsState.initial(args.user));
}

// ignore: unused_element
final Logger _logger = Logger('UserDetailsCubit');
