class AchievementModel {
  String userId;
  Metric highestPoint;
  Metric highestDistance;
  Metric highestWater;
  Metric highestStepCount;
  Metric highestCalorieBurned;

  AchievementModel({
    required this.userId,
    required this.highestPoint,
    required this.highestDistance,
    required this.highestWater,
    required this.highestStepCount,
    required this.highestCalorieBurned,
  });
}

class Metric {
  double value;
  DateTime date;

  Metric({
    required this.value,
    required this.date,
  });
}
