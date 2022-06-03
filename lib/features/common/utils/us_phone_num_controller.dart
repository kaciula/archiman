import 'package:phone_number/phone_number.dart';

class UsPhoneNumController extends PhoneNumberEditingController {
  UsPhoneNumController({String? text})
      : super(PhoneNumberUtil(), regionCode: 'US', text: text);
}
