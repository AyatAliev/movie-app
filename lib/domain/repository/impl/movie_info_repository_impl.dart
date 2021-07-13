import 'package:dio/dio.dart';
import 'package:flutter_api_with_retrofit/common/api/api_client.dart';
import 'package:flutter_api_with_retrofit/domain/repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {

  ApiClient _apiService = ApiClient();

  @override
  Future<Response> getInfoMovie(int id, Map<String, String> queryParameters) {
    return _apiService.getInfoMovie(id, queryParameters);
  }

  @override
  Future<Response> moviePopular(Map<String, String> queryParameters ) {
   return _apiService.moviePopular(queryParameters);
  }

}
