import 'package:flutter/material.dart';

import '../atoms/circular_progress.dart';

class ModalProgressHUD extends StatelessWidget {
  const ModalProgressHUD({
    Key? key,
    required this.inAsyncCall,
    this.opacity = 0.3,
    this.color = Colors.grey,
    this.progressIndicator = const CircularProgress(),
    this.dismissible = false,
    required this.child,
  }) : super(key: key);

  final bool inAsyncCall;
  final double opacity;
  final Color color;
  final Widget progressIndicator;
  final bool dismissible;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        if (inAsyncCall) ...[
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: Opacity(
              opacity: opacity,
              child: ModalBarrier(dismissible: dismissible, color: color),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: Center(child: progressIndicator),
          )
        ]
      ],
    );
  }
}
