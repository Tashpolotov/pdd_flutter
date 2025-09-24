import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdd_flutter_new_24_04_25/config/CommonState.dart';
import 'package:pdd_flutter_new_24_04_25/models/main/lesson/ListLessonModel.dart';
import 'package:pdd_flutter_new_24_04_25/models/main/test/TestModel.dart';
import '../state/test_cubit.dart';
import 'lesson_row_item.dart';
import 'lesson_test_item.dart';
import 'lesson_state_widgets.dart';

/// Основной виджет списка уроков
class LessonList extends StatelessWidget {
  final List<ListLessonModel> lessons;
  final int lessonId;

  const LessonList({
    super.key,
    required this.lessons,
    required this.lessonId,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ..._buildLessonItems(),
        _buildTestSection(),
      ],
    );
  }

  /// Построение элементов уроков
  List<Widget> _buildLessonItems() {
    return lessons.asMap().entries.map((entry) {
      final index = entry.key;
      final lesson = entry.value;
      final isLeft = index % 2 == 0;

      return LessonRowItem(
        lesson: lesson,
        isLeft: isLeft,
        lessonId: lessonId,
      );
    }).toList();
  }

  /// Построение секции теста
  Widget _buildTestSection() {
    return BlocBuilder<TestCubit, CommonState<TestModel>>(
      builder: (context, state) {
        return switch (state) {
          Loading() => LessonStateWidgets.testLoading(),
          Success(:final data) => LessonTestItem(
              test: data,
              lessonId: lessonId,
            ),
          Error(:final message) => LessonStateWidgets.testError(message),
          _ => LessonStateWidgets.empty(),
        };
      },
    );
  }
}
