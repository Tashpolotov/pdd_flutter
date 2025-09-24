import 'package:pdd_flutter_new_24_04_25/data/home/home_repository.dart';
import 'package:pdd_flutter_new_24_04_25/models/main/game_model/QuestionsModel.dart';

class GetQuestionsUseCase {
  final HomeRepository repository;
  GetQuestionsUseCase(this.repository);

  Future<List<QuestionsModel>> execute(int levelId, int lessonId) async {
    return await repository.getQuestions(levelId, lessonId);
  }
}