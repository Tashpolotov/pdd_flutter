
import 'package:pdd_flutter_new_24_04_25/data/home/home_repository.dart';
import 'package:pdd_flutter_new_24_04_25/models/main/lesson/ListLessonModel.dart';

class GetListLevelUseCase {
  final HomeRepository repository;
  GetListLevelUseCase(this.repository);

  Future<List<ListLessonModel>> execute(int levelId) async {
    return await repository.getListLesson(levelId);
  }
}