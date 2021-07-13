import 'package:dio/dio.dart';
import 'package:flutter_api_with_retrofit/common/api/api_client.dart';
import '../movie_data_source.dart';

class MovieImplDataSource extends MovieDataSource {

  ApiClient _apiClient;

  @override
  Future<Response> getInfoMovie(int id, Map<String, String> queryParameters) async {
    return await _apiClient.getInfoMovie(id, queryParameters);

  }

  @override
  Future<Response> moviePopular(Map<String, String> queryParameters) async {
    return await _apiClient.moviePopular(queryParameters);

  }

}