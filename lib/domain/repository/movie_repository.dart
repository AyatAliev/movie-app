import 'package:dio/dio.dart';

abstract class MovieRepository {

  Future<Response<dynamic>> moviePopular(Map<String,String> queryParameters);

  Future<Response<dynamic>> getInfoMovie(int id,Map<String,String> queryParameters);

}
