import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_bloc/Phone_Authentication_Firebase_Cubit/Cubit/auth_cubit.dart';
import 'package:form_validation_bloc/Phone_Authentication_Firebase_Cubit/Cubit/auth_state.dart';
import 'VerifyScreen.dart';

class SignInScreen extends StatelessWidget {
  var numberController = TextEditingController();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: numberController,
              decoration: const InputDecoration(
                  hintText: "enter number", border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10.0),
            BlocConsumer<AuthCubit,AuthState>(
              listener: (context, state) {
                if(state is AuthCodeSendState)
                  {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => VerifyScreen()));
                  }
              },
              builder: (context, state) {
                if(state is AuthLoadingState){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return SizedBox(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: CupertinoButton(
                    onPressed: () {
                      String phoneNo = "+91${numberController.text}";
                    BlocProvider.of<AuthCubit>(context).sendOtp(phoneNo);
                    },
                    color: Colors.grey,
                    child: const Text("Send Otp"),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
