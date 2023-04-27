// To parse this JSON data, do
//
//     final empty = emptyFromJson(jsonString);

import 'dart:convert';

Auth emptyFromJson(String str) => Auth.fromJson(json.decode(str));

String emptyToJson(Auth data) => json.encode(data.toJson());

class Auth {
  bool status;
  String message;
  Data data;

  Auth({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
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
  String token;

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
