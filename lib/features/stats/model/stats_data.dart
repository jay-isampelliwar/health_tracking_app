// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  bool status;
  String message;
  List<StatsData> data;

  DataModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        status: json["status"],
        message: json["message"],
        data: List<StatsData>.from(
            json["data"].map((x) => StatsData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class StatsData {
  String? id;
  String? userId;
  int? stepCount;
  int? caloriesBurned;
  double? walkDistance;
  int? heartRate;
  int? water;
  int? points;
  DateTime? date;
  int? v;

  StatsData({
    this.id,
    this.userId,
    this.stepCount,
    this.caloriesBurned,
    this.walkDistance,
    this.heartRate,
    this.water,
    this.points,
    this.date,
    this.v,
  });

  factory StatsData.fromJson(Map<String, dynamic> json) => StatsData(
        id: json["_id"],
        userId: json["user_id"],
        stepCount: json["step_count"],
        caloriesBurned: json["calories_burned"],
        walkDistance: json["walk_distance"]?.toDouble(),
        heartRate: json["heart_rate"],
        water: json["water"],
        points: json["points"],
        date: DateTime.parse(json["date"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user_id": userId,
        "step_count": stepCount,
        "calories_burned": caloriesBurned,
        "walk_distance": walkDistance,
        "heart_rate": heartRate,
        "water": water,
        "points": points,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "__v": v,
      };
}
