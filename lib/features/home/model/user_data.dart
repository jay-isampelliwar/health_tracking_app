class UserDataModel {
  int step_count;
  int calories_burned;
  int walk_distance;
  int water;
  int points;

  UserDataModel({
    required this.calories_burned,
    required this.walk_distance,
    required this.water,
    required this.points,
    required this.step_count,
  });
}
