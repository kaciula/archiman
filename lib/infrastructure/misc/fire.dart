import 'package:firebase_core/firebase_core.dart';

class Fire {
  Future<void> init() async {
    await Firebase.initializeApp();
  }
}
