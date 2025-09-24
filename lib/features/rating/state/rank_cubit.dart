import 'package:pdd_flutter_new_24_04_25/core/base/base_cubit.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_rank_use_case.dart';
import 'package:pdd_flutter_new_24_04_25/models/rank/RankModel.dart';

class RankCubit extends BaseCubit<List<RankModel>> {
  final GetRankUseCase _getRankUseCase;

  RankCubit(this._getRankUseCase) {
    loadRanking();
  }
  void loadRanking() {
    safeExecute(() => _getRankUseCase.execute());
  }

  @override
  void refresh() {
    loadRanking();
  }
}
