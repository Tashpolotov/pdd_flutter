
import 'package:pdd_flutter_new_24_04_25/models/main/lesson/ListLessonModel.dart';
import 'package:pdd_flutter_new_24_04_25/models/main/level/LessonModel.dart';
import 'package:pdd_flutter_new_24_04_25/services/pdd_api/api.dart';

import '../../models/main/test/TestModel.dart';

class HomeRepository {
  late final PddApiClient apiClient;

  HomeRepository({required this.apiClient});

  Future<List<LessonModel>> getAllLevel() async {
    return await apiClient.getAllLevelCard();
  }

  Future<List<ListLessonModel>> getListLesson(int levelId) async {
    return await apiClient.getListLesson(levelId);
  }

  Future<TestModel> getTest(int levelId) async {
    return await apiClient.getTest(levelId);
  }
}
