import 'package:flutter/material.dart';

class AdaptableScrollView2 extends StatelessWidget {
  const AdaptableScrollView2({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Column child;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: child,
        ),
      ],
    );
  }
}
