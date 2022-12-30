import 'package:archiman/features/common/data/remote/json/utils.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'facebook_connector.freezed.dart';

class FacebookConnector {
  Future<FacebookSignInResult> signIn() async {
    try {
      await signOut();

      final LoginResult result = await FacebookAuth.instance.login(
          permissions: const ['email', 'public_profile'],
          loginBehavior: LoginBehavior.dialogOnly);
      if (result.status == LoginStatus.success) {
        final AccessToken accessToken = result.accessToken!;
        final Map<String, dynamic> fields = await FacebookAuth.instance
            .getUserData(fields: 'email,first_name,last_name');
        return FacebookSignInSuccess(
          emailAddress: fields['email'],
          firstName: fields['first_name'],
          lastName: fields['last_name'],
          userId: accessToken.userId,
        );
      } else {
        _logger.warning('Facebook error: ${result.message} ${result.status} ');
        return FacebookSignInFailure();
      }
    } catch (e, stackTrace) {
      _logger.warning(e);
      return FacebookSignInFailure(
        errorDetails: mapGeneralErrorDetails(e, stackTrace),
      );
    }
  }

  Future<void> signOut() async {
    try {
      await FacebookAuth.instance.logOut();
    } catch (error) {
      // Do nothing. We were probably not signed in beforehand
    }
  }
}

@freezed
class FacebookSignInResult with _$FacebookSignInResult {
  factory FacebookSignInResult.success({
    required String emailAddress,
    required String firstName,
    required String lastName,
    required String userId,
  }) = FacebookSignInSuccess;

  factory FacebookSignInResult.failure({
    String? errorMsg,
    String? errorDetails,
  }) = FacebookSignInFailure;
}

// ignore: unused_element
final Logger _logger = Logger('FacebookConnector');
