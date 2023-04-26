import 'package:health_tracking_app/features/achievement/model/achievement_model.dart';
import 'package:health_tracking_app/features/auth/model/user_model.dart';
import 'package:health_tracking_app/features/home/model/user_data.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static final _client = http.Client();
  http.Client get client => _client;

  Future<void> login(User? model) async {
    try {} catch (err) {}
  }

  Future<void> registration(User? model) async {
    try {} catch (err) {}
  }

  Future<void> verifyOtp({User? model}) async {
    try {} catch (err) {}
  }

  Future<User> userDetails() async {
    try {} catch (err) {}
    return User(email: "");
  }

  Future<void> getData() async {
    try {} catch (err) {}
  }

  Future<void> getAchievement() async {
    try {} catch (err) {}
  }

  Future<void> postData({UserDataModel? model}) async {
    try {} catch (err) {}
  }

  Future<void> postAchievement({AchievementModel? model}) async {
    try {} catch (err) {}
  }
}
