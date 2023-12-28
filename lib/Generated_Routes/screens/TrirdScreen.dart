import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_bloc/Generated_Routes/Cubit/FirstCubit.dart';
import 'package:form_validation_bloc/Generated_Routes/Cubit/SecoundCubit.dart';
import 'package:form_validation_bloc/Generated_Routes/Cubit/ThirdCubit.dart';

import 'SecoundScreen.dart';

class TrirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        title:
            const Text("Third Screen", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
/*        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) => BlocProvider(
                    create: (context) => SecoundCubit(),child: SecoundScreen()),));
              },
              icon: const Icon(Icons.arrow_forward, color: Colors.white))
        ]*/
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          BlocProvider.of<ThirdCubit>(context).increment();
        },
      ),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<ThirdCubit, int>(
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
