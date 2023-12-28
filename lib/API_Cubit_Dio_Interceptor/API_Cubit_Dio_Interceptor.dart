import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_bloc/API_Cubit_Dio_Interceptor/Screen/HomeScreen.dart';
import 'package:form_validation_bloc/API_Cubit_Dio_Interceptor/cubit/PostCubit.dart';

class API_Cubit_Dio_Interceptor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(create: (context) => PostCubit(), child: HomeScreen()),
    );
  }
}
