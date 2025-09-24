import 'package:pdd_flutter_new_24_04_25/models/main/lesson/ListLessonModel.dart';
import 'package:pdd_flutter_new_24_04_25/models/main/test/TestModel.dart';
import '../components/lesson_level_item.dart';

/// Логика обработки статусов уроков и тестов
class LessonLogic {
  /// Маппинг статуса урока на основе модели
  static LessonStatus mapLessonStatus(ListLessonModel lesson) {
    if (!(lesson.available ?? false)) return LessonStatus.locked;
    if (lesson.isPassed ?? false) return LessonStatus.completed;
    if (lesson.isLesson ?? false) return LessonStatus.current;
    return LessonStatus.finalLesson;
  }

  /// Маппинг статуса теста на основе модели
  static LessonStatus mapTestStatus(TestModel test) {
    if (!(test.available ?? false)) return LessonStatus.locked;
    if (test.isPassed ?? false) return LessonStatus.completed;
    if (test.isTest) return LessonStatus.finalLesson;
    return LessonStatus.current;
  }

  /// Получение текста для статуса (Начать/Повторить)
  static String getStatusText(LessonStatus status) {
    return status == LessonStatus.completed ? 'Повторить' : 'Начать';
  }

  /// Приватный конструктор для предотвращения создания экземпляров
  LessonLogic._();
}
