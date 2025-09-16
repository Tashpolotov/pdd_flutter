import 'package:pdd_flutter_new_24_04_25/data/rank/rank_repository.dart';
import 'package:pdd_flutter_new_24_04_25/models/rank/RankModel.dart';

class GetRankUseCase {
  final RankRepository repository;

  GetRankUseCase(this.repository);

  Future<List<RankModel>> execute() async {
    return await repository.getRankUsers();
  }
}
