import 'package:dio/dio.dart';
import 'package:flutter_api_with_retrofit/network/api_service.dart';

class MovieInfoRepository {

  ApiService _apiService = ApiService();

  Future<Response<dynamic>> getInfoMovie(int id,Map<String,String> queryParameters) {
    return _apiService.getInfoMovie(id,queryParameters);
  }


}