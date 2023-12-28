import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_bloc/API_Cubit_Dio_Interceptor/cubit/PostState.dart';
import 'package:form_validation_bloc/API_Cubit_Dio_Interceptor/model/PostModel.dart';
import 'package:form_validation_bloc/API_Cubit_Dio_Interceptor/repo/PostRepo.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoadingState()){
    fetchPost();
  }

  PostRepo postRepo = PostRepo();

  void fetchPost() async {
    try {
      List<PostModel> posts = await postRepo.fetchPosts();
      emit(PostLoadedState(posts));
    } catch (ex) {
      emit(PostErrorState(ex.toString()));
    }
  }
}
