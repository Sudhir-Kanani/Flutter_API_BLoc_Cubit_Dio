import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/SecoundCubit.dart';

class SecondScreen extends StatefulWidget {
  final String title;

  const SecondScreen({super.key, required this.title});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/third");
              },
              icon: const Icon(Icons.arrow_forward, color: Colors.white))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          BlocProvider.of<SecoundCubit>(context).increment();
        },
      ),
      body: SafeArea(
        child: Center(
          child: BlocBuilder<SecoundCubit, int>(
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
