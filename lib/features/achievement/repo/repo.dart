import 'package:health_tracking_app/features/achievement/model/achievement_model.dart';

import '../../../api_provider/api_provider.dart';

class AchievementRepo {
  final ApiProvider _apiProvider = ApiProvider();

  Future<AchievementDataModel> getAchievement() async {
    return await _apiProvider.getAchievement();
  }
}
