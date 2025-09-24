import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdd_flutter_new_24_04_25/config/CommonState.dart';
import 'package:pdd_flutter_new_24_04_25/core/base/base_cubit.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_list_level_use_case.dart';
import 'package:pdd_flutter_new_24_04_25/models/main/lesson/ListLessonModel.dart';

class LessonCubit extends BaseCubit<List<ListLessonModel>> {
  final GetListLevelUseCase _getListLevelUseCase;
  int? _levelId;
  LessonCubit(this._getListLevelUseCase);

  void lessonInfo(int levelId)  {
    _levelId = levelId;
    safeExecute(() => _getListLevelUseCase.execute(levelId));
  }

  @override
  void refresh() {
    lessonInfo(_levelId!);
  }
}

