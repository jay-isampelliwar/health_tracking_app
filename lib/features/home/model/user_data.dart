class UserDataModel {
  int step_count;
  int calories_burned;
  int walk_distance;
  int heart_rate;
  int water;
  int points;
  String date;

  UserDataModel({
    required this.calories_burned,
    required this.walk_distance,
    required this.heart_rate,
    required this.water,
    required this.points,
    required this.date,
    required this.step_count,
  });
}
