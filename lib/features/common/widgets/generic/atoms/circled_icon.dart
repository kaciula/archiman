import 'package:flutter/material.dart';

class CircledIcon extends StatelessWidget {
  const CircledIcon({
    Key? key,
    required this.size,
    required this.iconSize,
    required this.iconData,
    this.isCircle = true,
    required this.iconColor,
    this.bgColor,
    this.borderColor,
  }) : super(key: key);

  final double size;
  final double iconSize;
  final IconData iconData;
  final bool isCircle;
  final Color iconColor;
  final Color? bgColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          border: borderColor != null ? Border.all(color: borderColor!) : null,
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        ),
        child: SizedBox(
          height: size,
          width: size,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Icon(
              iconData,
              color: iconColor,
              size: iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
