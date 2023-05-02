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
  DataValue? data;

  AchievementDataModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AchievementDataModel.fromJson(Map<String, dynamic> json) {
    return AchievementDataModel(
      status: json["status"],
      message: json["message"],
      data: json["data"] == null ? null : DataValue.fromJson(json["data"]),
    );
  }
  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class DataValue {
  Highest? highestPoint;
  Highest? highestDistance;
  Highest? highestWater;
  Highest? highestStepCount;
  Highest? highestCalorieBurned;

  DataValue({
    this.highestPoint,
    this.highestDistance,
    this.highestWater,
    this.highestStepCount,
    this.highestCalorieBurned,
  });

  factory DataValue.fromJson(Map<String, dynamic> json) => DataValue(
        highestPoint: Highest.fromJson(json["highest_point"]),
        highestDistance: Highest.fromJson(json["highest_distance"]),
        highestWater: Highest.fromJson(json["highest_water"]),
        highestStepCount: Highest.fromJson(json["highest_step_count"]),
        highestCalorieBurned: Highest.fromJson(json["highest_calorie_burned"]),
      );

  Map<String, dynamic> toJson() => {
        "highest_point": highestPoint!.toJson(),
        "highest_distance": highestDistance!.toJson(),
        "highest_water": highestWater!.toJson(),
        "highest_step_count": highestStepCount!.toJson(),
        "highest_calorie_burned": highestCalorieBurned!.toJson(),
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
