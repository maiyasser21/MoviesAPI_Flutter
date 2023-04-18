import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:task/data/datasource/remote/config.dart';
import 'package:task/data/model/Movies.dart';

import 'constants.dart';

class ApiService {
  ApiService._();
  static final ApiService api = ApiService._();

  Future<Movies> fetchdata() async {
    Dio dio = Config.getDio();
    String url = 'popular';
    Response response =
        await dio.get(url, queryParameters: {'api_key': apikey});
    if (response.statusCode == 200) {
      return Movies.fromJson(response.data);
    } else {
      throw Exception('Unable to fetch data');
    }
  }
}
