// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserDetailsModel userDetailsModelFromJson(String str) =>
    UserDetailsModel.fromJson(json.decode(str));

String userDetailsModelToJson(UserDetailsModel data) =>
    json.encode(data.toJson());

class UserDetailsModel {
  bool status;
  String message;
  UserDetailsSubModel? data;

  UserDetailsModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) =>
      UserDetailsModel(
        status: json["status"],
        message: json["message"],
        data: UserDetailsSubModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class UserDetailsSubModel {
  String name;
  String email;

  UserDetailsSubModel({
    required this.name,
    required this.email,
  });

  factory UserDetailsSubModel.fromJson(Map<String, dynamic> json) =>
      UserDetailsSubModel(
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
      };
}
