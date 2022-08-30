import 'package:capstoe_frontend/models/user.dart';
import 'package:dio/dio.dart';

class AuthServices {
  final _dio = Dio();
  final _baseUrl = 'http://10.0.2.2:8000';
  Future<String> signup({required User user}) async {
    String token = "";
    print(user);
    try {
      Response response =
          await _dio.post(_baseUrl + '/register/', data: user.toJson());
      //token = response.data["access"];

      print(response.data);
    } on DioError catch (error) {
      token = "ok";
      print(error);
    }
    return token;
  }

  Future<String> signin(
      {required String username, required String password}) async {
    String token = "";

    try {
      Response response = await _dio.post(_baseUrl + '/login/',
          data: {"username": username, "password": password});
      //token = response.data["access"];

      print(response.data);
    } on DioError catch (error) {
      token = "ok";
      print(error);
    }
    return token;
  }
}
