import '../../../api_provider/api_provider.dart';

class StatsRepo {
  final ApiProvider _apiProvider = ApiProvider();

  void getData() async {
    await _apiProvider.postData();
  }
}
