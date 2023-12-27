import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_bloc/Phone_Authentication_Firebase_Cubit/Cubit/auth_cubit.dart';
import 'package:form_validation_bloc/Phone_Authentication_Firebase_Cubit/Cubit/auth_state.dart';

import 'HomeScreen.dart';

class VerifyScreen extends StatelessWidget {
  var numberController = TextEditingController();

  VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Otp Verify", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: numberController,
              decoration: const InputDecoration(
                  hintText: "enter Otp", border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: BlocConsumer<AuthCubit, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CupertinoButton(
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context)
                            .verifyOtp(numberController.text);
                      },
                      color: Colors.grey,
                      child: const Text("Verify Otp"),
                    ),
                  );
                },
                listener: (context, state) {
                  if (state is AuthLogInState) {
                    Navigator.popUntil(
                        context,
                        (route) => route
                            .isFirst); //close all pages and remaining first using popUntil
                    Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: (context) =>
                                HomeScreen())); // replace HomeScreen with first page using pushReplacement
                  }
                  if (state is AuthErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.error,
                          style: const TextStyle(color: Colors.white)),
                      backgroundColor: Colors.red,
                      duration: const Duration(microseconds: 2000),
                    ));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
