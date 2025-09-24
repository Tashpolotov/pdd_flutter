import 'package:pdd_flutter_new_24_04_25/core/base/base_cubit.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_questions_use_case.dart';
import 'package:pdd_flutter_new_24_04_25/models/main/game_model/QuestionsModel.dart';

class QuestionsCubit extends BaseCubit<List<QuestionsModel>> {
  final GetQuestionsUseCase _getQuestionsUseCase;
  int? _levelId;
  int? _lessonId;

  QuestionsCubit(this._getQuestionsUseCase);

  void getQuestions(int levelId, int lessonId) {
    _levelId = levelId;
    _lessonId = lessonId;
    safeExecute(() => _getQuestionsUseCase.execute(levelId, lessonId));
  }

  @override
  void refresh() {
    getQuestions(_levelId!, _lessonId!);
  }
}
