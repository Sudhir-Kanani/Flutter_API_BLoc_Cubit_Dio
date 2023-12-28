import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_bloc/Generated_Routes/Cubit/FirstCubit.dart';
import 'package:form_validation_bloc/Generated_Routes/screens/FirstScreen.dart';

import 'Routes.dart';

class Generated_Routes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      debugShowCheckedModeBanner: false,
     onGenerateRoute: Routes.onGenerateRoute,
      initialRoute: "/first",
    );
  }
}
