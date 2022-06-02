import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(
        Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
