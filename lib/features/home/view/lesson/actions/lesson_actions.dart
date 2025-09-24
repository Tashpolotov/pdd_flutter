import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppBottomSheet.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppRoutes.dart';
import 'package:pdd_flutter_new_24_04_25/models/main/test/TestModel.dart';
import '../components/lesson_level_item.dart';
import '../logic/lesson_logic.dart';

/// Обработчики действий для экрана уроков
class LessonActions {
  /// Обработка нажатия на урок
  static void onLevelTap(
    BuildContext context, {
    required int levelNumber,
    required LessonStatus status,
    required String title,
    required int lessonId,
    required int levelId,
  }) {
    if (status == LessonStatus.locked) {
      _showLockedLessonDialog(context, title);
      return;
    }

    if (status == LessonStatus.finalLesson) {
      _showFinalExamDialog(context);
      return;
    }

    _showLessonConfirmationDialog(
      context,
      status: status,
      levelNumber: levelNumber,
      title: title,
      lessonId: lessonId,
      levelId: levelId,
    );
  }

  /// Обработка нажатия на тест
  static void onTestTap(
    BuildContext context, {
    required TestModel test,
    required int lessonId,
  }) {
    final status = LessonLogic.mapTestStatus(test);

    if (status == LessonStatus.locked) {
      _showLockedTestDialog(context, test.title ?? 'Тест');
      return;
    }

    _showTestConfirmationDialog(
      context,
      status: status,
      test: test,
      lessonId: lessonId,
    );
  }

  /// Показ диалога заблокированного урока
  static void _showLockedLessonDialog(BuildContext context, String title) {
    AppBottomSheet.show(
      context,
      message: 'Урок "$title" заблокирован.\nСначала пройдите предыдущие уроки.',
      type: BottomSheetType.error,
    );
  }

  /// Показ диалога финального экзамена
  static void _showFinalExamDialog(BuildContext context) {
    AppBottomSheet.show(
      context,
      message: '🎉 Финальный экзамен\nПройдите все уроки для доступа!',
      backgroundColor: Colors.orange,
    );
  }

  /// Показ диалога подтверждения урока
  static void _showLessonConfirmationDialog(
    BuildContext context, {
    required LessonStatus status,
    required int levelNumber,
    required String title,
    required int lessonId,
    required int levelId,
  }) {
    final statusText = LessonLogic.getStatusText(status);
    
    AppBottomSheet.show(
      context,
      message: '$statusText урок $levelNumber: "$title"',
      actionLabel: statusText.toUpperCase(),
      onAction: () {
        context.push(
          AppRoutes.gamePath,
          extra: {'lessonId': lessonId, 'levelId': levelId},
        );
      },
      type: BottomSheetType.lesson,
      backgroundColor: status == LessonStatus.completed 
          ? const Color(0xFF58D68D) 
          : null,
    );
  }

  /// Показ диалога заблокированного теста
  static void _showLockedTestDialog(BuildContext context, String testTitle) {
    AppBottomSheet.show(
      context,
      message: 'Тест "$testTitle" заблокирован.\nСначала пройдите все уроки.',
      type: BottomSheetType.error,
    );
  }

  /// Показ диалога подтверждения теста
  static void _showTestConfirmationDialog(
    BuildContext context, {
    required LessonStatus status,
    required TestModel test,
    required int lessonId,
  }) {
    final statusText = LessonLogic.getStatusText(status);
    
    AppBottomSheet.show(
      context,
      message: '🎯 $statusText тест: "${test.title ?? 'Тест'}"',
      actionLabel: statusText.toUpperCase(),
      onAction: () {
        // TODO: Добавить переход на экран теста
        // context.push('/test/${test.id}', extra: {'lessonId': lessonId});
      },
      type: BottomSheetType.test,
    );
  }

  /// Приватный конструктор для предотвращения создания экземпляров
  LessonActions._();
}
