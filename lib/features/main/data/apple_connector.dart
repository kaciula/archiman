import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

part 'apple_connector.freezed.dart';

class AppleConnector {
  AppleConnector(this.dio);

  final Dio dio;

  Future<AppleSignInResult> signIn() async {
    try {
      final AuthorizationCredentialAppleID result =
          await SignInWithApple.getAppleIDCredential(
        scopes: <AppleIDAuthorizationScopes>[
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      return AppleSignInSuccess(
        emailAddress:
            result.email ?? _obtainEmailAddress(result.identityToken!),
        firstName: result.givenName, // non-null just the first time
        lastName: result.familyName, // non-null just the first time
        idToken: result.identityToken!,
      );
    } catch (error) {
      _logger.warning(error);
      if (error is SignInWithAppleAuthorizationException &&
          error.code == AuthorizationErrorCode.canceled) {
        return AppleSignInCancelled();
      }
    }
    return AppleSignInFailure();
  }

  String _obtainEmailAddress(String token) {
    final Map<String, dynamic> fields = _parseJwtTokenPayload(token);
    return fields['email'];
  }

  Map<String, dynamic> _parseJwtTokenPayload(String token) {
    final List<String> parts = token.split('.');
    final String payload = _decodeBase64(parts[1]);
    return json.decode(payload) as Map<String, dynamic>;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');
    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal Base64Url string!');
    }
    return utf8.decode(base64Url.decode(output));
  }

  Future<bool> isSupported() async => SignInWithApple.isAvailable();
}

@freezed
class AppleSignInResult with _$AppleSignInResult {
  factory AppleSignInResult.success({
    required String emailAddress,
    required String? firstName,
    required String? lastName,
    required String idToken,
  }) = AppleSignInSuccess;

  factory AppleSignInResult.cancelled() = AppleSignInCancelled;

  factory AppleSignInResult.failure({
    String? errorMsg,
    String? errorDetails,
  }) = AppleSignInFailure;
}

// ignore: unused_element
final Logger _logger = Logger('AppleConnector');
