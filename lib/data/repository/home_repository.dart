import 'package:dio/dio.dart';
import 'package:flutter_api_with_retrofit/data/api/service/api_service.dart';

class HomeRepository {

  ApiService _apiService = ApiService();

  Future<Response<dynamic>> moviePopular(Map<String,String> queryParameters) {
    return _apiService.moviePopular(queryParameters);
  }

}
