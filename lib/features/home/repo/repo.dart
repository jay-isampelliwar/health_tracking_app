import 'package:health_tracking_app/api_provider/api_provider.dart';
import 'package:health_tracking_app/features/home/model/user_data.dart';

import '../../auth/model/user_model.dart';
import '../model/achievement.dart';

class HomeRepo {
  final ApiProvider _apiProvider = ApiProvider();

  void postData(UserDataModel model) async {
    await _apiProvider.postData(model: model);
  }

  void postAchievement(AchievementModel model) async {
    await _apiProvider.postAchievement(model: model);
  }

  void userDetail() async {
    User user = await _apiProvider.userDetails();
  }
}
