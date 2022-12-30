import 'package:flutter/material.dart';

class AdaptableScrollView1 extends StatelessWidget {
  const AdaptableScrollView1({
    Key? key,
    required this.child,
    required this.centerColumnVertically,
  }) : super(key: key);

  final Column child;
  final bool centerColumnVertically;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) =>
          SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: constraints.maxWidth,
            minHeight: constraints.maxHeight,
          ),
          child: IntrinsicHeight(
            child: centerColumnVertically
                ? Column(
                    mainAxisAlignment: child.mainAxisAlignment,
                    mainAxisSize: child.mainAxisSize,
                    children: [
                      Spacer(),
                      ...child.children,
                      Spacer(),
                    ],
                  )
                : child,
          ),
        ),
      ),
    );
  }
}
