import 'package:flutter/material.dart';
import 'package:pdd_flutter_new_24_04_25/models/main/lesson/ListLessonModel.dart';
import '../components/lesson_level_item.dart';
import '../constants/lesson_constants.dart';
import '../logic/lesson_logic.dart';
import '../actions/lesson_actions.dart';

/// Виджет для отображения строки урока в зигзагообразном списке
class LessonRowItem extends StatelessWidget {
  final ListLessonModel lesson;
  final bool isLeft;
  final int lessonId;

  const LessonRowItem({
    super.key,
    required this.lesson,
    required this.isLeft,
    required this.lessonId,
  });

  @override
  Widget build(BuildContext context) {
    final status = LessonLogic.mapLessonStatus(lesson);

    return SizedBox(
      height: LessonConstants.rowHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isLeft)
            _buildLessonItem(context, status, Alignment.centerRight, true)
          else
            const Expanded(child: SizedBox()),
          
          const SizedBox(width: 0),
          
          if (!isLeft)
            _buildLessonItem(context, status, Alignment.centerLeft, false)
          else
            const Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  /// Построение элемента урока с правильным выравниванием
  Widget _buildLessonItem(
    BuildContext context,
    LessonStatus status,
    Alignment alignment,
    bool isOnLeftSide,
  ) {
    return Expanded(
      child: Align(
        alignment: alignment,
        child: Padding(
          padding: EdgeInsets.only(
            left: isOnLeftSide ? 0 : LessonConstants.horizontalPadding,
            right: isOnLeftSide ? LessonConstants.horizontalPadding : 0,
          ),
          child: LessonLevelItem(
            levelNumber: lesson.order ?? 0,
            status: status,
            isOnLeftSide: isOnLeftSide,
            onTap: () => _onLessonTap(context, status),
          ),
        ),
      ),
    );
  }

  /// Обработка нажатия на урок
  void _onLessonTap(BuildContext context, LessonStatus status) {
    LessonActions.onLevelTap(
      context,
      levelNumber: lesson.order ?? 0,
      status: status,
      title: lesson.title ?? '',
      lessonId: lessonId,
      levelId: lesson.id ?? 0,
    );
  }
}
