import 'package:health_tracking_app/features/stats/model/stats_data.dart';

import '../../../api_provider/api_provider.dart';

class StatsRepo {
  final ApiProvider _apiProvider = ApiProvider();

  Future<DataModel> getData() async {
    return await _apiProvider.getData();
  }
}
