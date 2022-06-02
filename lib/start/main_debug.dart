import 'package:archiman/app/app.dart';
import 'package:flutter/material.dart';

import 'main_utils.dart';
import 'service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await registerInstances();
  await init();

  return runApp(const ThisApp());
}
