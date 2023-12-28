
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:form_validation_bloc/API_Cubit_Dio_Interceptor/repo/PostRepo.dart';
import 'package:form_validation_bloc/Generated_Routes/Generated_Routes.dart';

import 'API_Cubit_Dio_Interceptor/API_Cubit_Dio_Interceptor.dart';
import 'API_Cubit_Dio_Interceptor/model/PostModel.dart';
import 'Phone_Authentication_Firebase_Cubit/Phone_Authentication_Firebase.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);



  runApp(API_Cubit_Dio_Interceptor());
}


