// To parse this JSON data, do
//
//     final baseModel = baseModelFromJson(jsonString);

import 'dart:convert';

BaseModel baseModelFromJson(String str) => BaseModel.fromJson(json.decode(str));

String baseModelToJson(BaseModel data) => json.encode(data.toJson());

class BaseModel {
  bool status;
  String message;
  Data data;

  BaseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory BaseModel.fromJson(Map<String, dynamic> json) => BaseModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  String? token;

  Data({
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
