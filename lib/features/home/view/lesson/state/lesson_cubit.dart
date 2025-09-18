import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdd_flutter_new_24_04_25/config/CommonState.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_list_level_use_case.dart';
import 'package:pdd_flutter_new_24_04_25/models/main/lesson/ListLessonModel.dart';

class LessonCubit extends Cubit<CommonState<List<ListLessonModel>>> {
  final GetListLevelUseCase _getListLevelUseCase;

  LessonCubit(this._getListLevelUseCase) : super(const CommonState.initial());

  Future<void> lessonInfo(int levelId) async {
    emit(const CommonState.loading());

    try {
      final response = await _getListLevelUseCase.execute(levelId);
      emit(CommonState.success(response));
    } catch (e) {
      emit(CommonState.error("Ошибка: ${e.toString()}"));
    }
  }
}


