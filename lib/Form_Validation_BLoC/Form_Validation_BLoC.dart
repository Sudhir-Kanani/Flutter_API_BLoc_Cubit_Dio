import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/SignInBloc.dart';
import 'bloc/SignInEvent.dart';
import 'bloc/SignInState.dart';



class Form_Validation_BLoC extends StatelessWidget {
  const Form_Validation_BLoC({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: SignInPage(),
      ),
    );
  }
}

class SignInPage extends StatelessWidget {
  var emailValidator = TextEditingController();
  var passValidator = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Validation"),
        backgroundColor: CupertinoColors.lightBackgroundGray,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            BlocBuilder<SignInBloc, SignInState>(
              builder: (context, state) {
                if (state is SignInErrorState) {
                  return Text(state.errorMsg,
                      style: const TextStyle(color: Colors.red));
                } else {
                  return Container();
                }
              },
            ),
            TextField(
              controller: emailValidator,
              decoration: const InputDecoration(hintText: "enter email"),
              onChanged: (value) {
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangeEvent(
                    emailValidator.text, passValidator.text));
              },
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: passValidator,
              decoration: const InputDecoration(hintText: "enter pass"),
              onChanged: (value) {
                BlocProvider.of<SignInBloc>(context).add(SignInTextChangeEvent(
                    emailValidator.text, passValidator.text));
              },
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: BlocBuilder<SignInBloc, SignInState>(
                builder: (context, state) {
                  if (state is SingInLoadingState) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return CupertinoButton(
                    onPressed: () {
                      if (state is SignInValidState) {
                        BlocProvider.of<SignInBloc>(context).add(
                            SignInSubmitedEvent(
                                emailValidator.text, passValidator.text));
                      }
                    },
                    color: (state is SignInValidState)
                        ? Colors.blue
                        : Colors.black12,
                    child: const Text("Sign In"),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}