
import 'package:dio/dio.dart';
import 'package:flutter_api_with_retrofit/utils/constants.dart';

class ApiClient {

  Future<Response> getInfoMovie(int id, Map<String, String> queryParameters) async {

    var response = await Dio()
        .get(BASEURL + "3/movie/$id", queryParameters: queryParameters);

    if (response.statusCode == 200) {
      return response;
    } else {
      throw "Error body";
    }
  }

  Future<Response> moviePopular(Map<String, String> queryParameters) async {
    var response = await Dio().get(
        BASEURL + "3/movie/popular",queryParameters: queryParameters);

    if (response.statusCode == 200) {

      return response;
    } else {
      throw "Error body";
    }
  }

}