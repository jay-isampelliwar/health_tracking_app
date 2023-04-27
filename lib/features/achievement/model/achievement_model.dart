// To parse this JSON data, do
//
//     final achievementDataModel = achievementDataModelFromJson(jsonString);

import 'dart:convert';

AchievementDataModel achievementDataModelFromJson(String str) =>
    AchievementDataModel.fromJson(json.decode(str));

String achievementDataModelToJson(AchievementDataModel data) =>
    json.encode(data.toJson());

class AchievementDataModel {
  bool status;
  String message;
  Data data;

  AchievementDataModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AchievementDataModel.fromJson(Map<String, dynamic> json) =>
      AchievementDataModel(
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
  Highest highestPoint;
  Highest highestDistance;
  Highest highestWater;
  Highest highestStepCount;
  Highest highestCalorieBurned;
  String id;
  String userId;
  int v;

  Data({
    required this.highestPoint,
    required this.highestDistance,
    required this.highestWater,
    required this.highestStepCount,
    required this.highestCalorieBurned,
    required this.id,
    required this.userId,
    required this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        highestPoint: Highest.fromJson(json["highest_point"]),
        highestDistance: Highest.fromJson(json["highest_distance"]),
        highestWater: Highest.fromJson(json["highest_water"]),
        highestStepCount: Highest.fromJson(json["highest_step_count"]),
        highestCalorieBurned: Highest.fromJson(json["highest_calorie_burned"]),
        id: json["_id"],
        userId: json["user_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "highest_point": highestPoint.toJson(),
        "highest_distance": highestDistance.toJson(),
        "highest_water": highestWater.toJson(),
        "highest_step_count": highestStepCount.toJson(),
        "highest_calorie_burned": highestCalorieBurned.toJson(),
        "_id": id,
        "user_id": userId,
        "__v": v,
      };
}

class Highest {
  int value;
  DateTime date;

  Highest({
    required this.value,
    required this.date,
  });

  factory Highest.fromJson(Map<String, dynamic> json) => Highest(
        value: json["value"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "date": date.toIso8601String(),
      };
}
