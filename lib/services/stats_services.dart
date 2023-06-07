import 'package:covid19_tracker/model/world_stats_model.dart';
import 'package:covid19_tracker/utils/constants/app_constants.dart';
import 'package:http/http.dart' as https;

class StatsServices {
  Future<WorldStatsModel> getWorldStats() async {
    try {
      final response = await https.get(
        Uri.parse(AppConstants.worldStats),
      );
      if (response.statusCode == 200) {
        return worldStatsModelFromJson(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }
}
