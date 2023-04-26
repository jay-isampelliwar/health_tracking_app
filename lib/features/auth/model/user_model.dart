import 'dart:io';

class User {
  File? image;
  String? name;
  String email;
  String? password;
  String? otp;
  User({
    this.otp,
    this.image,
    this.name,
    this.password,
    required this.email,
  });
}
