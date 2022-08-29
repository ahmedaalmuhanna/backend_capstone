// ignore_for_file: public_member_api_docs, sort_constructors_first
class Profile {
  String? image;
  String? bio;
  int user_id;

  Profile({
    this.image,
    this.bio,
    required this.user_id,
  });
}
