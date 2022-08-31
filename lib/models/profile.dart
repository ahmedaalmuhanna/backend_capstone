// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Profile {
  String image;
  String username;
  String bio;

  Profile({
    required this.image,
    required this.username,
    required this.bio,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'username': username,
      'bio': bio,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      image: (map['image'] ?? "https://i.imgur.com/An7G9J1b.jpg") as String,
      username: map['user'] as String,
      bio: map['bio'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) =>
      Profile.fromMap(json.decode(source) as Map<String, dynamic>);
}
