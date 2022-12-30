import 'package:flutter/material.dart';

class GenericCircularProgress extends StatelessWidget {
  const GenericCircularProgress({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(color),
    );
  }
}
