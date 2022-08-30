import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

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
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
