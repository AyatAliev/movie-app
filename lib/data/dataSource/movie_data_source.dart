import 'package:dio/dio.dart';

abstract class MovieDataSource {

  Future<Response<dynamic>> moviePopular(Map<String,String> queryParameters);

  Future<Response<dynamic>> getInfoMovie(int id,Map<String, String> queryParameters);
}
