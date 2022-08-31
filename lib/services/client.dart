import 'package:dio/dio.dart';

class Client {
  static const _baseUrl = "http://localhost:8000/";
  static final Dio dio = Dio(BaseOptions(baseUrl: _baseUrl));
}
