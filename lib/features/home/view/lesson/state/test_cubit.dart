import 'package:pdd_flutter_new_24_04_25/core/base/base_cubit.dart';
import 'package:pdd_flutter_new_24_04_25/models/main/test/TestModel.dart';
import '../../../../../domain/get_list_level_use_case.dart';

class TestCubit extends BaseCubit<TestModel> {
  final GetListLevelUseCase _getListLevelUseCase;
  int? _levelId;

  TestCubit(this._getListLevelUseCase);

  void testInfo(int levelId) {
    _levelId = levelId;
    safeExecute(() => _getListLevelUseCase.executeTest(levelId));
  }

  @override
  void refresh() {
    testInfo(_levelId!);
  }
}