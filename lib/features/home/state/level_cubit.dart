
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdd_flutter_new_24_04_25/config/CommonState.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_level_use_case.dart';
import 'package:pdd_flutter_new_24_04_25/models/main/level/LessonModel.dart';

class LevelCubit extends Cubit<CommonState<List<LessonModel>>> {
  final GetLevelUseCase _getLevelUseCase;

  LevelCubit(this._getLevelUseCase) : super(const CommonState.initial()) {
    levelInfo();
  }

  Future<void> levelInfo() async {
    emit(const CommonState.loading());

    try {
      final response = await _getLevelUseCase.execute();
      emit(CommonState.success(response));
    } catch (e) {
      emit(CommonState.error("Ошибка: ${e.toString()}"));
    }
  }
}