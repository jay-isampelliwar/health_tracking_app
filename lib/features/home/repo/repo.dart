import 'package:health_tracking_app/api_provider/api_provider.dart';
import 'package:health_tracking_app/features/achievement/model/achievement_model.dart';
import 'package:health_tracking_app/features/home/model/user.dart';
import 'package:health_tracking_app/features/home/model/user_data.dart';
import 'package:health_tracking_app/features/home/model/user_details_model.dart';

import '../model/achievement.dart';

class HomeRepo {
  final ApiProvider _apiProvider = ApiProvider();

  Future<UserModel> postData(UserDataModel model) async {
    return await _apiProvider.postData(model: model);
  }

  Future<AchievementDataModel> postAchievement(AchievementModel model) async {
    return await _apiProvider.postAchievement(model: model);
  }

  Future<UserDetailsModel> userDetail() {
    return _apiProvider.userDetails();
  }
}
