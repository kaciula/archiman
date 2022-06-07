import 'package:archiman/features/common/data/utils.dart';
import 'package:archiman/features/main/data/data_store.dart';
import 'package:archiman/features/main/models/stack_user.dart';
import 'package:archiman/infrastructure/misc/crash/crash_reporter.dart';
import 'package:dio/dio.dart';
import 'package:kt_dart/kt.dart';
import 'package:logging/logging.dart';

import 'json/stack_users_json.dart';

class RemoteDataStore extends DataStore {
  RemoteDataStore(this.dio, this.crashReporter);

  final Dio dio;
  final CrashReporter crashReporter;

  @override
  Future<StackUsersResult> getStackUsers() async {
    try {
      final Response<dynamic> response = await dio.get(
        'https://api.stackexchange.com/users',
        queryParameters: {
          'site': 'stackoverflow',
        },
      );
      final KtList<StackUser> stackUsers =
          StackUsersJson.fromJson(response.data).map();
      return StackUsersSuccess(stackUsers: stackUsers);
    } on DioError catch (e) {
      return StackUsersFailure(errorDetails: mapErrorDetails(e));
    } catch (e, stackTrace) {
      crashReporter.reportUnexpectedError(
          Exception(e.toString()), stackTrace, _logger.name);
      return StackUsersFailure(
        errorDetails: mapGeneralErrorDetails(e, stackTrace),
      );
    }
  }
}

// ignore: unused_element
final Logger _logger = Logger('RemoteDataStore');
