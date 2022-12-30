import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

class GenericInfoDialog extends StatelessWidget {
  const GenericInfoDialog({
    Key? key,
    required this.msg,
    required this.btnLabel,
    required this.onPressed,
    required this.isPlatformSpecific,
  }) : super(key: key);

  final String msg;
  final String btnLabel;
  final VoidCallback? onPressed;
  final bool isPlatformSpecific;

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid || !isPlatformSpecific
        ? _materialDialog(context)
        : _cupertinoDialog(context);
  }

  Widget _materialDialog(BuildContext context) {
    return AlertDialog(
      content: Text(msg),
      actions: <Widget>[
        TextButton(
          child: Text(btnLabel),
          onPressed: () {
            Navigator.of(context).pop();
            onPressed?.call();
          },
        ),
      ],
    );
  }

  Widget _cupertinoDialog(BuildContext context) {
    return CupertinoAlertDialog(
      content: Text(msg),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text(btnLabel),
          onPressed: () {
            Navigator.of(context).pop();
            onPressed?.call();
          },
        ),
      ],
    );
  }
}
