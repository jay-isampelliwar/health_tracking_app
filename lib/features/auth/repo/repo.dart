import 'package:health_tracking_app/features/auth/model/auth_model.dart';
import 'package:health_tracking_app/features/auth/model/user_model.dart';

import '../../../api_provider/api_provider.dart';

class AuthRepo {
  final ApiProvider _apiProvider = ApiProvider();

  Future<AuthModel> login(User model) {
    return _apiProvider.login(model);
  }

  Future<AuthModel> registration(User model) {
    return _apiProvider.registration(model);
  }

  Future<AuthModel> verifyOtp(User model) {
    return _apiProvider.verifyOtp(model: model);
  }
}
