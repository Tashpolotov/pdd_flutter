import 'package:bloc/bloc.dart';
import 'package:pdd_flutter_new_24_04_25/config/CommonState.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_rank_use_case.dart';
import 'package:pdd_flutter_new_24_04_25/models/rank/RankModel.dart';

class RankCubit extends Cubit<CommonState<List<RankModel>>> {
  final GetRankUseCase _getRankUseCase;

  RankCubit(this._getRankUseCase) : super(const CommonState.initial()) {
    rankInfo();
  }

  Future<void> rankInfo() async {
    emit(const CommonState.loading());

    try {
      final response = await _getRankUseCase.execute();
      emit(CommonState.success(response));
        } catch (e) {
      emit(CommonState.error("Ошибка: ${e.toString()}"));
    }
  }
}
