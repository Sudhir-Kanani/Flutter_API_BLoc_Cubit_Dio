
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Phone_Authentication_Firebase_Cubit/Phone_Authentication_Firebase.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Phone_Authentication_Firebase());
}


