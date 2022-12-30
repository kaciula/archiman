import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

import 'material_ink_well.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialInkWell(
      onTap: () => Navigator.of(context).pop(),
      child: Padding(
        padding: EdgeInsets.all(12),
        child:
            Icon(Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios),
      ),
    );
  }
}
