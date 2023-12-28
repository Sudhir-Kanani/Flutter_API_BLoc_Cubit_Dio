import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_bloc/Generated_Routes/Cubit/FirstCubit.dart';
import 'package:form_validation_bloc/Generated_Routes/Cubit/SecoundCubit.dart';
import 'package:form_validation_bloc/Generated_Routes/Cubit/ThirdCubit.dart';
import 'package:form_validation_bloc/Generated_Routes/screens/FirstScreen.dart';
import 'package:form_validation_bloc/Generated_Routes/screens/SecoundScreen.dart';
import 'package:form_validation_bloc/Generated_Routes/screens/TrirdScreen.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/first":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => FirstCubit(),
                  child: FirstScreen(),
                ));

      case "/second":
        Map<String, dynamic> arg =
            settings.arguments as Map<String, dynamic>; // pass arguments
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => SecoundCubit(),
                  child: SecondScreen(
                    title: arg["title"],
                  ), // get using key
                ));

      case "/third":
        return MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (context) => ThirdCubit(),
                  child: TrirdScreen(),
                ));

      default:
        return null;
    }
  }
}
