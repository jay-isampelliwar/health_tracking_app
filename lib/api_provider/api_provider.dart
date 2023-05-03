import 'package:health_tracking_app/core/constants/app_url.dart';
import 'package:health_tracking_app/features/achievement/model/achievement_model.dart';
import 'package:health_tracking_app/features/auth/model/auth_model.dart';
import 'package:health_tracking_app/features/auth/model/user_model.dart';
import 'package:health_tracking_app/features/home/model/user.dart';
import 'package:health_tracking_app/features/home/model/user_data.dart';
import 'package:health_tracking_app/features/stats/model/stats_data.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

import '../features/home/model/achievement.dart';

class ApiProvider {
  static final _client = http.Client();
  http.Client get client => _client;
  final box = Hive.box("user");
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
      var header = {"Authorization": "Bearer ${box.get("token")}"};

      var response = await client.get(uri, headers: header);

      return userModelFromJson(response.body);
    } catch (err) {
      return UserModel(status: false, message: err.toString(), data: null);
    }
  }

  Future<DataModel> getData() async {
    try {
      var uri = Uri.parse(BASE_URL + USER_DATA_GET);
      var header = {"Authorization": "Bearer ${box.get("token")}"};
      var response = await client.get(uri, headers: header);
      return dataModelFromJson(response.body);
    } catch (err) {
      return DataModel(
          status: false, message: "Something went wrong", data: []);
    }
  }

  Future<AchievementDataModel> getAchievement() async {
    try {
      var uri = Uri.parse(BASE_URL + USER_ACHIEVEMENT_GET);
      var header = {"Authorization": "Bearer ${box.get("token")}"};
      var response = await client.get(uri, headers: header);
      return achievementDataModelFromJson(response.body);
    } catch (err) {
      return AchievementDataModel(
        status: false,
        message: "Something went wring",
        data: null,
      );
    }
  }

  Future<UserModel> postData({UserDataModel? model}) async {
    try {
      var url = Uri.parse(BASE_URL + USER_DATA_POST);
      var body = {
        "step_count": model!.step_count.toString(),
        "calories_burned": model.calories_burned.toString(),
        "walk_distance": model.walk_distance.toString(),
        "water": model.water.toString(),
        "points": model.points.toString(),
        "date": DateTime.now().toString(),
      };
      var header = {"Authorization": "Bearer ${box.get("token")}"};
      var response = await client.post(url, body: body, headers: header);
      return userModelFromJson(response.body);
    } catch (err) {
      return UserModel(
          status: false,
          message: "Something went wrong, Please try it again",
          data: PostDataModel(water: 0, steps: 0));
    }
  }

  Future<AchievementDataModel> postAchievement(
      {AchievementModel? model}) async {
    try {
      var url = Uri.parse(BASE_URL + USER_ACHIEVEMENT_POST);
      var header = {"Authorization": "Bearer ${box.get("token")}"};
      var body = {
        "highest_point": {
          "value": model!.highestPoint.value.toString(),
          "date": model.highestPoint.value.toString()
        },
        "highest_distance": {
          "value": model.highestDistance.value.toString(),
          "date": model.highestDistance.value.toString()
        },
        "highest_water": {
          "value": model.highestWater.value.toString(),
          "date": model.highestWater.value.toString()
        },
        "highest_step_count": {
          "value": model.highestStepCount.value.toString(),
          "date": model.highestStepCount.value.toString()
        },
        "highest_calorie_burned": {
          "value": model.highestCalorieBurned.value.toString(),
          "date": model.highestCalorieBurned.value.toString()
        }
      };
      var response = await client.post(url, body: body, headers: header);
      return achievementDataModelFromJson(response.body);
    } catch (err) {
      return AchievementDataModel(
          status: false, message: "Something went wrong", data: null);
    }
  }
}
