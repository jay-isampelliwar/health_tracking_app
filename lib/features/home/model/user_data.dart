class UserDataModel {
  double step_count;
  double calories_burned;
  double walk_distance;
  double water;
  double points;

  UserDataModel({
    required this.calories_burned,
    required this.walk_distance,
    required this.water,
    required this.points,
    required this.step_count,
  });
}
