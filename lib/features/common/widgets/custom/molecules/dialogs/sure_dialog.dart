import 'package:archiman/app/app_strings.al.dart';
import 'package:archiman/app/app_styles.dart';
import 'package:archiman/features/common/widgets/generic/molecules/dialogs/generic_sure_dialog.dart';
import 'package:flutter/material.dart';

class SureDialog extends StatelessWidget {
  const SureDialog({
    Key? key,
    this.title,
    required this.msg,
    this.details,
    this.yesBtnLabel,
    this.noBtnLabel,
    required this.onYesPressed,
    this.onNoPressed,
  }) : super(key: key);

  final String? title;
  final String msg;
  final String? details;
  final String? yesBtnLabel;
  final String? noBtnLabel;
  final VoidCallback onYesPressed;
  final VoidCallback? onNoPressed;

  @override
  Widget build(BuildContext context) {
    return GenericSureDialog(
      title: title,
      msg: msg,
      details: details,
      yesBtnLabel: yesBtnLabel ?? Strings.genericYes.get(),
      noBtnLabel: noBtnLabel ?? Strings.genericNo.get(),
      onYesPressed: onYesPressed,
      onNoPressed: onNoPressed,
      isPlatformSpecific: true,
      cupertinoColor: AppColors.red,
    );
  }
}
