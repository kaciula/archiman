import 'package:archiman/app/app_styles.dart';
import 'package:flutter/material.dart';

import '../../generic/atoms/generic_circular_progress.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({
    Key? key,
    this.color = AppColors.blue,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return GenericCircularProgress(color: color);
  }
}
