import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

class GenericSureDialog extends StatelessWidget {
  const GenericSureDialog({
    Key? key,
    required this.title,
    required this.msg,
    required this.details,
    required this.yesBtnLabel,
    required this.noBtnLabel,
    required this.onYesPressed,
    required this.onNoPressed,
    required this.isPlatformSpecific,
    required this.cupertinoColor,
  }) : super(key: key);

  final String? title;
  final String msg;
  final String? details;
  final String yesBtnLabel;
  final String noBtnLabel;
  final VoidCallback onYesPressed;
  final VoidCallback? onNoPressed;
  final bool isPlatformSpecific;
  final Color? cupertinoColor;

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid || !isPlatformSpecific
        ? _materialDialog(context)
        : _cupertinoDialog(context);
  }

  Widget _materialDialog(BuildContext context) {
    return AlertDialog(
      title: title != null ? Text(title!) : null,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(msg),
          if (details != null)
            Container(
              margin: EdgeInsets.only(top: 12),
              child: Text(details!),
            ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text(noBtnLabel),
          onPressed: () {
            Navigator.of(context).pop();
            onNoPressed?.call();
          },
        ),
        TextButton(
          child: Text(yesBtnLabel),
          onPressed: () {
            Navigator.of(context).pop();
            onYesPressed();
          },
        ),
      ],
    );
  }

  Widget _cupertinoDialog(BuildContext context) {
    return CupertinoAlertDialog(
      title: title != null ? Text(title!) : null,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(msg),
          if (details != null)
            Container(
              margin: EdgeInsets.only(top: 12),
              child: Text(details!),
            ),
        ],
      ),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text(
            noBtnLabel,
            style: TextStyle(color: cupertinoColor),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            onNoPressed?.call();
          },
        ),
        CupertinoDialogAction(
          child: Text(
            yesBtnLabel,
            style: TextStyle(color: cupertinoColor),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            onYesPressed();
          },
        ),
      ],
    );
  }
}
