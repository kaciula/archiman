import 'package:archiman/features/common/data/remote/json/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logging/logging.dart';

part 'google_connector.freezed.dart';

class GoogleConnector {
  final GoogleSignIn _google =
      GoogleSignIn(scopes: <String>['email', 'profile']);

  Future<GoogleSignInResult> signIn() async {
    try {
      await signOut();

      final GoogleSignInAccount? googleUser = await _google.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        return GoogleSignInSuccess(
          emailAddress: googleUser.email,
          fullName: googleUser.displayName ?? '',
          idToken: googleAuth.idToken!,
        );
      } else {
        // This is probably due to cancelling the sign in (going back)
        return GoogleSignInCancel();
      }
    } catch (e, stackTrace) {
      _logger.warning(e);
      return GoogleSignInFailure(
        errorDetails: mapGeneralErrorDetails(e, stackTrace),
      );
    }
  }

  Future<void> signOut() async {
    try {
      await _google.disconnect();
    } catch (error) {
      // Do nothing. We were probably not signed in beforehand
    }
  }
}

@freezed
class GoogleSignInResult with _$GoogleSignInResult {
  factory GoogleSignInResult.success({
    required String emailAddress,
    required String fullName,
    required String idToken,
  }) = GoogleSignInSuccess;

  factory GoogleSignInResult.cancel() = GoogleSignInCancel;

  factory GoogleSignInResult.failure({
    String? errorMsg,
    String? errorDetails,
  }) = GoogleSignInFailure;
}

// ignore: unused_element
final Logger _logger = Logger('GoogleConnector');
