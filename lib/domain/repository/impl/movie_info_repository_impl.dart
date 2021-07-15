import 'package:dio/dio.dart';
import 'package:flutter_api_with_retrofit/data/dataSource/impl/movie_data_source_impl.dart';
import 'package:flutter_api_with_retrofit/domain/repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  MovieRepositoryImpl(this._implDataSource);

  final MovieImplDataSource _implDataSource;

  @override
  Future<Response<dynamic>> getInfoMovie(int id, Map<String, String> queryParameters) {
    return _implDataSource.getInfoMovie(id, queryParameters);
  }

  @override
  Future<Response<dynamic>> moviePopular(Map<String, String> queryParameters ) {
   return _implDataSource.moviePopular(queryParameters);
  }

}
