import '../../../api_provider/api_provider.dart';

class AchievementRepo {
  final ApiProvider _apiProvider = ApiProvider();

  void getAchievement() async {
    await _apiProvider.getAchievement();
  }
}
