import 'package:flutter/material.dart';

class MaterialInkWell extends StatelessWidget {
  const MaterialInkWell({
    super.key,
    required this.onTap,
    required this.child,
    this.color,
    this.borderRadius,
    this.border,
  });

  final VoidCallback onTap;
  final Widget child;
  final Color? color;
  final BorderRadius? borderRadius;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: borderRadius,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Ink(
          decoration: BoxDecoration(
            color: color,
            borderRadius: borderRadius,
            border: border,
          ),
          child: child,
        ),
      ),
    );
  }
}
