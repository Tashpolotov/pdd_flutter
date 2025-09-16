import '../../models/rank/RankModel.dart';
import '../../services/pdd_api/api.dart';

class RankRepository {
  late final PddApiClient apiClient;

  RankRepository({required this.apiClient});

  Future<List<RankModel>> getRankUsers() async {
    try {
      final response = await apiClient.getRankUsers();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
