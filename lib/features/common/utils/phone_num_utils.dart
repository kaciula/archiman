import 'package:phonenumbers_core/core.dart';

class PhoneNumUtils {
  PhoneNumUtils._();

  static String usNationalNumber(String phoneNum) {
    final String phoneNormalized = PhoneNumber.normalize(phoneNum);
    final PhoneNumber phoneNumber =
        PhoneNumber.isoCode(_countryCodeUS, phoneNormalized);
    return phoneNumber.nationalNumber;
  }

  static String usInternationalNumber(String phoneNum) {
    final String phoneNormalized = PhoneNumber.normalize(phoneNum);
    final PhoneNumber phoneNumber =
        PhoneNumber.isoCode(_countryCodeUS, phoneNormalized);
    return phoneNumber.formattedNumber;
  }
}

const String _countryCodeUS = 'US';
