import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_bloc/API_Cubit_Dio_Interceptor/cubit/PostCubit.dart';
import 'package:form_validation_bloc/API_Cubit_Dio_Interceptor/cubit/PostState.dart';

import '../model/PostModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Api Calling"), centerTitle: true),
      body: SafeArea(
        child: BlocConsumer<PostCubit, PostState>(
          listener: (context, state) {
            if (state is PostErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(state.error.toString()),
                  backgroundColor: Colors.red));
            }
          },
          builder: (context, state) {
            if (state is PostLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PostLoadedState) {
              return buildPostView(state.posts);
            }
            if (state is PostErrorState) {
              return Center(
                child: Text(state.error.toString()),
              );
            }
            return const Center(
              child: Text("erorr show"),
            );
          },
        ),
      ),
    );
  }

  Widget buildPostView(List<PostModel> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        PostModel postModel = posts[index];
        return ListTile(
          title: Text(postModel.title.toString()),
          subtitle: Text(postModel.body.toString()),

        );
      },
    );
  }
}
