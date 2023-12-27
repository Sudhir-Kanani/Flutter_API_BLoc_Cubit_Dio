import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_bloc/Phone_Authentication_Firebase_Cubit/Cubit/auth_cubit.dart';
import 'package:form_validation_bloc/Phone_Authentication_Firebase_Cubit/Cubit/auth_state.dart';
import 'package:form_validation_bloc/Phone_Authentication_Firebase_Cubit/screens/SignInScreen.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: BlocConsumer<AuthCubit,AuthState>(
          builder: (context, state) {
           return CupertinoButton(
              onPressed: () {
                BlocProvider.of<AuthCubit>(context).logOut();
              },
              child: Text("Logout"),
            );
          },
          listener: (context, state) {
            if(state is AuthLogOutState){
              Navigator.popUntil(context, (route) => route.isFirst); //close all pages and remaining first using popUntil
              Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => SignInScreen())); // replace SignInScreen with first page using pushReplacement
            }
          },
        ),
      ),
    );
  }

}