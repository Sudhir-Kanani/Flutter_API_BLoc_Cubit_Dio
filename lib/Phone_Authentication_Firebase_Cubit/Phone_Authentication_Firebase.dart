import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_bloc/Phone_Authentication_Firebase_Cubit/Cubit/auth_cubit.dart';
import 'package:form_validation_bloc/Phone_Authentication_Firebase_Cubit/Cubit/auth_state.dart';
import 'package:form_validation_bloc/Phone_Authentication_Firebase_Cubit/screens/HomeScreen.dart';
import 'package:form_validation_bloc/Phone_Authentication_Firebase_Cubit/screens/SignInScreen.dart';

class Phone_Authentication_Firebase extends StatelessWidget {
  const Phone_Authentication_Firebase({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        title: "",
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (previous, current) {
            return previous is AuthInitState; // check old state is init state then check below builder
          },
          builder: (context, state) {
            if (state is AuthLogInState) {
              return HomeScreen();
            } else if (state is AuthLogOutState) {
              return SignInScreen();
            } else {
              return const Scaffold();
            }
          },
        ),
      ),
    );
  }
}
