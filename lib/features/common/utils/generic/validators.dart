import 'package:archiman/app/app_strings.al.dart';
import 'package:phonenumbers_core/core.dart';

// ignore: avoid_classes_with_only_static_members
class Validators {
  const Validators._();

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  static bool _isEmailValid(String value) {
    return _emailRegExp.hasMatch(value);
  }

  static String? emailValidator(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return Strings.required.get();
    }
    if (!_isEmailValid(value!.trim())) {
      return Strings.validEmail.get();
    }
    return null;
  }

  static String? requiredValidator(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return Strings.required.get();
    }
    return null;
  }

  static String? phoneNumValidator(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return Strings.required.get();
    }

    const String countryCodeUS = 'US';
    String valueNormalized = PhoneNumber.normalize(value!);
    final PhoneNumber phoneNumber =
        PhoneNumber.isoCode(countryCodeUS, valueNormalized);
    if (!phoneNumber.isValid) {
      return Strings.invalidPhoneNumber.get();
    }
    return null;
  }
}
