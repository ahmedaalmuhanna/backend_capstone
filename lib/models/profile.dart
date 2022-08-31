// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Profile {
  String image;
  String username;
  String bio;
  int user_id;

  Profile({
    required this.image,
    required this.username,
    required this.bio,
    required this.user_id,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'username': username,
      'bio': bio,
      'user_id': user_id,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      image: map['image'] as String,
      username: map['user'] as String,
      bio: map['bio'] as String,
      user_id: map['user_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);
}
