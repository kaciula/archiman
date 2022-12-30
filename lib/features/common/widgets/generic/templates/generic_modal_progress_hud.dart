import 'package:flutter/material.dart';

class GenericModalProgressHUD extends StatelessWidget {
  const GenericModalProgressHUD({
    Key? key,
    required this.inAsyncCall,
    required this.color,
    required this.progressIndicator,
    required this.opacity,
    required this.child,
  }) : super(key: key);

  final bool inAsyncCall;
  final Color color;
  final Widget progressIndicator;
  final double opacity;
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
              child: ModalBarrier(dismissible: false, color: color),
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
