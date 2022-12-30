import 'package:archiman/app/app_strings.al.dart';
import 'package:archiman/features/common/widgets/generic/molecules/dialogs/generic_info_dialog.dart';
import 'package:flutter/material.dart';

class InfoDialog extends StatelessWidget {
  const InfoDialog({
    Key? key,
    required this.msg,
    this.onPressed,
  }) : super(key: key);

  final String msg;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GenericInfoDialog(
      msg: msg,
      btnLabel: Strings.genericOk.get(),
      onPressed: onPressed,
      isPlatformSpecific: true,
    );
  }
}
