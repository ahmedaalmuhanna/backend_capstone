import 'dart:io';

import 'package:capstoe_frontend/models/user.dart';
import 'package:capstoe_frontend/services/auth_services.dart';
import 'package:capstoe_frontend/services/client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/profile.dart';

class AuthProvider extends ChangeNotifier {
  Profile? user;
  String? user_id;

  String token = "";

//***************** SignUp */ */
  Future<bool> signup(User user) async {
    String token = "";

    try {
      Response response =
          await Client.dio.post('/api/register/', data: user.toMap());

      // tageee3
      await signin(username: user.username, password: user.password!);
      print(response.data);
      return true;
    } on DioError catch (error) {
      token = "";
      print(error);
      print(error.response?.data);
    }
    return false;
  }

//***************** Sign in*/ */
  Future<bool> signin({
    required String username,
    required String password,
  }) async {
    String token = "";

    try {
      Response response = await Client.dio.post('/api/login/', data: {
        "username": username,
        "password": password,
      });
      token = response.data["access"];
      await _gainAuthority(token);
      print(response.data);
      return true;
    } on DioError catch (error) {
      token = "";
      print(error);
    }

    return false;
  }
//***************** update profile */ */

  Future<bool> updateProfile(
      {required String username, required String bio, File? image}) async {
    try {
      FormData data = FormData.fromMap({
        "username": username,
        "bio": bio,
        "image": await MultipartFile.fromFile(image!.path),
      });
      print(user_id);
      Response res =
          await Client.dio.put("/api/profileupdate/$user_id", data: data);

      print(res.data);
      user = Profile.fromMap(res.data);
      return true;
    } on DioError catch (error) {
      print(error);
      print(error.response?.data);
    }
    notifyListeners();
    return false;
  }

  bool get isAuth => user != null;

  Future<bool> canLoginFromStoredToken() async {
    print("Attempting to login from stored token...");
    SharedPreferences prefe = await SharedPreferences.getInstance();

    var token = prefe.getString("token");

    if (token == null) {
      print("Failed. No token found");
      return false;
    }
    if (Jwt.isExpired(token)) {
      print("Failed: Token expired");
      return false;
    }
    await _gainAuthority(token);

    print("Logging in as ${user!.username}");

    return true;
  }

  Future<void> _gainAuthority(String token) async {
    print("Gaining authority");
    user_id = Jwt.parseJwt(token)['user_id']
        .toString(); // geting user id from encoded token

    Client.dio.options.headers = {
      HttpHeaders.authorizationHeader:
          "Bearer $token", //setting the auth. header
    };

    SharedPreferences pref =
        await SharedPreferences.getInstance(); // store token to
    await pref.setString("token", token);

    print("Requesting profile info for user: $user_id");
    var res = await Client.dio.get("/api/profile/${user_id}");
    print("Got data  ${res.data}");

    user = Profile.fromMap(res.data);
    print("Got profile with name  ${user!.username}");

    notifyListeners();
  }

  void logout() async {
    print("I'm logout");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    token = "";
    user = null;

    notifyListeners();
  }
}
