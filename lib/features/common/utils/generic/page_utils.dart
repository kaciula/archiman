import 'package:archiman/features/common/utils/generic/flutter_extensions.dart';
import 'package:flutter/widgets.dart';

class PageUtils {
  PageUtils._();

  static void hideKeyboard(BuildContext context) {
    final FocusScopeNode currentFocus = context.focusScope;
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}
