import 'package:archiman/app/app_styles.dart';
import 'package:flutter/material.dart';

class PasswordVisibilityIcon extends StatelessWidget {
  const PasswordVisibilityIcon({
    Key? key,
    required this.makePasswordVisible,
    required this.onTogglePasswordVisibility,
  }) : super(key: key);

  final bool makePasswordVisible;
  final VoidCallback onTogglePasswordVisibility;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTogglePasswordVisibility,
      icon: Icon(makePasswordVisible ? Icons.visibility : Icons.visibility_off),
      color: AppColors.black,
    );
  }
}
