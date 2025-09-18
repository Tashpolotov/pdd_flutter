import 'package:pdd_flutter_new_24_04_25/data/home/home_repository.dart';
import 'package:pdd_flutter_new_24_04_25/models/main/level/LessonModel.dart';

class GetLevelUseCase {
  final HomeRepository repository;

  GetLevelUseCase(this.repository);

  Future<List<LessonModel>> execute() async {
    return await repository.getAllLevel();
  }
}
