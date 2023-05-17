// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  bool status;
  String message;
  PostDataModel? data;

  UserModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        status: json["status"],
        message: json["message"],
        data: PostDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class PostDataModel {
  int steps;
  int water;

  PostDataModel({
    required this.steps,
    required this.water,
  });

  factory PostDataModel.fromJson(Map<String, dynamic> json) => PostDataModel(
        steps: json["step_count"],
        water: json["water"],
      );

  Map<String, dynamic> toJson() => {
        "name": steps,
        "email": water,
      };
}
