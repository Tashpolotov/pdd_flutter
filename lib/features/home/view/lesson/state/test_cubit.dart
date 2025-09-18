import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdd_flutter_new_24_04_25/models/main/test/TestModel.dart';

import '../../../../../config/CommonState.dart';
import '../../../../../domain/get_list_level_use_case.dart';

class TestCubit extends Cubit<CommonState<TestModel>> {
  final GetListLevelUseCase _getListLevelUseCase;

  TestCubit(this._getListLevelUseCase) : super(const CommonState.initial());

  Future<void> testInfo(int levelId) async {
    emit(const CommonState.loading());

    try {
      final response = await _getListLevelUseCase.executeTest(levelId);
      emit(CommonState.success(response));
    } catch (e) {
      emit(CommonState.error("Ошибка: ${e.toString()}"));
    }
  }
}
