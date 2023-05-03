// To parse this JSON data, do
//
//     final dataModel = dataModelFromJson(jsonString);

import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  bool status;
  String message;
  List<StatsData?> data;

  DataModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        status: json["status"],
        message: json["message"],
        data:
            List<StatsData>.from(json["data"].map((x) => StatsData.fromJson(x)))
                .toList(),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x!.toJson())),
      };
}

class StatsData {
  int? stepCount;
  double? caloriesBurned;
  double? walkDistance;
  int? water;
  int? points;
  DateTime? date;

  StatsData({
    this.stepCount,
    this.caloriesBurned,
    this.walkDistance,
    this.water,
    this.points,
    this.date,
  });

  factory StatsData.fromJson(dynamic json) => StatsData(
        stepCount: json["step_count"],
        caloriesBurned: json["calories_burned"],
        walkDistance: json["walk_distance"],
        water: json["water"],
        points: json["points"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "step_count": stepCount,
        "calories_burned": caloriesBurned,
        "walk_distance": walkDistance,
        "water": water,
        "points": points,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
      };
}
