import 'package:dio/dio.dart';
import 'package:flutter_api_with_retrofit/common/api/api_client.dart';
import '../movie_data_source.dart';

class MovieImplDataSource extends MovieDataSource {

  ApiClient _apiClient = ApiClient();

  @override
  Future<Response<dynamic>> getInfoMovie(int id, Map<String, String> queryParameters) {
    return _apiClient.getInfoMovie(id, queryParameters);

  }

  @override
  Future<Response<dynamic>> moviePopular(Map<String, String> queryParameters) {
    return _apiClient.moviePopular(queryParameters);

  }

}