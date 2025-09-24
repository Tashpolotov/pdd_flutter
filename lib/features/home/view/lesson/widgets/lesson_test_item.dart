import 'package:flutter/material.dart';
import 'package:pdd_flutter_new_24_04_25/models/main/test/TestModel.dart';
import '../components/lesson_level_item.dart';
import '../constants/lesson_constants.dart';
import '../logic/lesson_logic.dart';
import '../actions/lesson_actions.dart';

/// Виджет для отображения теста в списке уроков
class LessonTestItem extends StatelessWidget {
  final TestModel test;
  final int lessonId;

  const LessonTestItem({
    super.key,
    required this.test,
    required this.lessonId,
  });

  @override
  Widget build(BuildContext context) {
    final status = LessonLogic.mapTestStatus(test);

    return SizedBox(
      height: LessonConstants.rowHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: LessonLevelItem(
                levelNumber: test.id,
                status: status,
                isOnLeftSide: true,
                onTap: () => _onTestTap(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Обработка нажатия на тест
  void _onTestTap(BuildContext context) {
    LessonActions.onTestTap(
      context,
      test: test,
      lessonId: lessonId,
    );
  }
}
