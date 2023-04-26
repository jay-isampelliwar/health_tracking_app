import 'package:health_tracking_app/features/auth/model/user_model.dart';

import '../../../api_provider/api_provider.dart';

class AchievementRepo {
  final ApiProvider _apiProvider = ApiProvider();

  void login(User model) {
    _apiProvider.login(model);
  }

  void registration(User model) {
    _apiProvider.registration(model);
  }

  void verifyOtp(User model) {
    _apiProvider.verifyOtp();
  }
}
