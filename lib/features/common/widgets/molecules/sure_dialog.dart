import 'package:archiman/app/app_strings.al.dart';
import 'package:archiman/features/common/utils/generic/flutter_extensions.dart';
import 'package:flutter/material.dart';

class SureDialog extends StatelessWidget {
  const SureDialog({
    Key? key,
    required this.msg,
    required this.onYesPressed,
    this.onNoPressed,
  }) : super(key: key);

  final String msg;
  final VoidCallback onYesPressed;
  final VoidCallback? onNoPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(msg),
      actions: <Widget>[
        TextButton(
          child: Text(Strings.genericNo.get()),
          onPressed: () {
            context.pop();
            onNoPressed?.call();
          },
        ),
        TextButton(
          child: Text(Strings.genericYes.get()),
          onPressed: () {
            context.pop();
            onYesPressed();
          },
        ),
      ],
    );
  }
}
