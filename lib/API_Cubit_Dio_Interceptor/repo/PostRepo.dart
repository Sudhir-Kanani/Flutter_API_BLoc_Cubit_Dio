import 'dart:math';

import 'package:dio/dio.dart';
import 'package:form_validation_bloc/API_Cubit_Dio_Interceptor/model/PostModel.dart';
import 'package:form_validation_bloc/API_Cubit_Dio_Interceptor/repo/api/API.dart';

class PostRepo{

  API api = API();

  Future<List<PostModel>> fetchPosts() async {
    try
    {
      Response response  = await api.sendRequest.get("/posts");
      List<dynamic> postMaps = response.data;
      return postMaps.map((postMap) => PostModel.fromJson(postMap)).toList();
    }catch(ex){
    rethrow;
    }
  }
}