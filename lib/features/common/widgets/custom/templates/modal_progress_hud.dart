import 'package:archiman/app/app_styles.dart';
import 'package:flutter/material.dart';

import '../../generic/templates/generic_modal_progress_hud.dart';
import '../atoms/circular_progress.dart';

class ModalProgressHUD extends StatelessWidget {
  const ModalProgressHUD({
    Key? key,
    required this.inAsyncCall,
    this.color = AppColors.black,
    this.progressIndicator = const CircularProgress(),
    this.opacity = 0.3,
    required this.child,
  }) : super(key: key);

  final bool inAsyncCall;
  final Color color;
  final Widget progressIndicator;
  final double opacity;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GenericModalProgressHUD(
      inAsyncCall: inAsyncCall,
      color: color,
      progressIndicator: progressIndicator,
      opacity: opacity,
      child: child,
    );
  }
}
