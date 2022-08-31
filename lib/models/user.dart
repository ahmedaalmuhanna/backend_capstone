
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class User {
  int? id;
  String username;
  String? image;
  String? password;
  String? email;
  String? firstName;
  String? LastName;
  User({
    this.id,
    required this.username,
    this.image,
    this.password,
    this.email,
    this.firstName,
    this.LastName,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'image': image,
      'password': password,
      'email': email,
      'firstName': firstName,
      'LastName': LastName,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] != null ? map['id'] as int : null,
      username: map['username'] as String,
      image: map['image'] != null ? map['image'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      LastName: map['LastName'] != null ? map['LastName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

