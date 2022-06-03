import 'package:flutter/services.dart';

class PhoneNumLimiter extends LengthLimitingTextInputFormatter {
  PhoneNumLimiter(int maxLength) : super(maxLength);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length <= maxLength!) {
      return newValue;
    } else {
      return _numDigits(newValue.text) <= maxLength! ? newValue : oldValue;
    }
  }

  int _numDigits(String text) {
    int numDigits = 0;
    for (int i = 0; i < text.length; i++) {
      if (int.tryParse(text[i]) != null) {
        numDigits++;
      }
    }
    return numDigits;
  }
}
