import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_bloc/Generated_Routes/Cubit/FirstCubit.dart';
import 'package:form_validation_bloc/Generated_Routes/Cubit/SecoundCubit.dart';

import 'SecoundScreen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Text("First Screen", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/second",arguments: {
                  "title":"Dynamic title" // pass arguments
                });

              },
              icon: const Icon(Icons.arrow_forward, color: Colors.white))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          BlocProvider.of<FirstCubit>(context).increment();
        },
      ),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<FirstCubit, int>(
            builder: (context, state) {
              return Text(state.toString(),
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold));
            },
          ),
        ),
      ),
    );
  }
}
