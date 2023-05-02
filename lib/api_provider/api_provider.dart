import 'package:health_tracking_app/core/constants/app_url.dart';
import 'package:health_tracking_app/core/constants/token.dart';
import 'package:health_tracking_app/features/achievement/model/achievement_model.dart';
import 'package:health_tracking_app/features/auth/model/auth_model.dart';
import 'package:health_tracking_app/features/auth/model/user_model.dart';
import 'package:health_tracking_app/features/home/model/user.dart';
import 'package:health_tracking_app/features/home/model/user_data.dart';
import 'package:health_tracking_app/features/stats/model/stats_data.dart';
import 'package:http/http.dart' as http;

import '../features/home/model/achievement.dart';

class ApiProvider {
  static final _client = http.Client();
  http.Client get client => _client;

  Future<AuthModel> login(User? model) async {
    try {
      var body = {"email": model!.email, "password": model.password};

      var uri = Uri.parse(BASE_URL + USER_LOGIN);
      var response = await client.post(uri, body: body);
      return authModelFromJson(response.body);
    } catch (err) {
      return AuthModel(status: false, message: err.toString(), data: null);
    }
  }

  Future<AuthModel> registration(User? model) async {
    try {
      var body = {
        "name": model!.name,
        "email": model.email,
        "password": model.password
      };

      var uri = Uri.parse(BASE_URL + USER_REGISTRATION);
      var response = await client.post(uri, body: body);
      return authModelFromJson(response.body);
    } catch (err) {
      return AuthModel(status: false, message: err.toString(), data: null);
    }
  }

  Future<AuthModel> verifyOtp({User? model}) async {
    try {
      var body = {"otp": model!.otp, "email": model.email};
      var uri = Uri.parse(BASE_URL + USER_VERIFY_OTP);
      var response = await client.post(uri, body: body);
      return authModelFromJson(response.body);
    } catch (err) {
      return AuthModel(status: false, message: err.toString(), data: null);
    }
  }

  Future<UserModel> userDetails() async {
    try {
      var uri = Uri.parse(BASE_URL);
      var header = {"Authorization": "Bearer $token_value"};

      var response = await client.get(uri, headers: header);

      return userModelFromJson(response.body);
    } catch (err) {
      return UserModel(status: false, message: err.toString(), data: null);
    }
  }

  Future<DataModel> getData() async {
    try {} catch (err) {}
    return DataModel(status: false, message: "Something went wrong", data: []);
  }

  Future<AchievementDataModel> getAchievement() async {
    try {
      var uri = Uri.parse(BASE_URL + USER_ACHIEVEMENT_GET);
      var header = {"Authorization": "Bearer $token_value"};
      var response = await client.get(uri, headers: header);
      return achievementDataModelFromJson(response.body);
    } catch (err) {
      return AchievementDataModel(
          status: false, message: "Something went wring", data: DataValue());
    }
  }

  Future<void> postData({UserDataModel? model}) async {
    try {} catch (err) {}
  }

  Future<void> postAchievement({AchievementModel? model}) async {
    try {} catch (err) {}
  }
}
