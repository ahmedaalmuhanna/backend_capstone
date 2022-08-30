import 'package:capstoe_frontend/models/user.dart';
import 'package:capstoe_frontend/services/auth_services.dart';
import 'package:capstoe_frontend/services/client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  late User user;

  void signup(User user) async {
    await AuthServices().signup(user: user);
  }

  Future<bool> signin(
      {required String username, required String password}) async {
    String token = "";

    try {
      Response response = await Client.dio.post('/login/', data: {
        "username": username,
        "password": password,
      });
      //token = response.data["access"];

      print(response.data);
      return true;
    } on DioError catch (error) {
      token = "ok";
      print(error);
    }

    return false;
  }
}
