import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_api_with_retrofit/domain/repository/impl/movie_info_repository_impl.dart';

class MovieUseCase {
  MovieUseCase(this.repositoryImpl);

  final MovieRepositoryImpl repositoryImpl;

  Future<Either<String, Response<dynamic>>> moviePopular(Map<String, String> queryParams) async {
    try {
      var response = await repositoryImpl.moviePopular(queryParams);
      return Right(response);
    } catch (e) {
     return Left("failure movie info");
    }
  }

  Future<Either<String, Response<dynamic>>> getInfoMovie(int id, Map<String, String> queryParameters) async {
    try {
      var response = await repositoryImpl.getInfoMovie(id,queryParameters);
      return Right(response);
    } catch (e) {
      return Left("failure get Info Movie");
    }
  }
}
