import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:pdd_flutter_new_24_04_25/config/CommonState.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_list_level_use_case.dart';
import 'package:pdd_flutter_new_24_04_25/features/home/view/lesson/state/lesson_cubit.dart';
import 'package:pdd_flutter_new_24_04_25/models/main/lesson/ListLessonModel.dart';
import '../../../../config/AppColors.dart';
import '../../../../config/appbar_custom.dart';
import 'components/lesson_level_item.dart';
import 'components/lesson_path_connector.dart';

//
class LessonView extends StatelessWidget {
  const LessonView({super.key});

  @override
  Widget build(BuildContext context) {
    final lessonId = GoRouterState.of(context).extra as int;
    return Scaffold(
      backgroundColor: AppColors.app_background,
      appBar: AppbarCustom(
        titleAppBar: "Название уровня (тема)",
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: BlocProvider(
          create: (context) => LessonCubit(context.read<GetListLevelUseCase>())..lessonInfo(lessonId),
          child: BlocConsumer<LessonCubit, CommonState<List<ListLessonModel>>>(
            listener: (context, state) {
              if (state is Error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text((state as Error).message)),
                );
              }
            },
            builder: (context, state) {
              if (state is Loading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is Success<List<ListLessonModel>>) {
                final lessons = state.data;
                return Column(children: _buildLessonPathFromData(context, lessons));
              }
              return const Center(child: Text('Нет данных'));
            },
          ),
        ),


      ),
    );
  }

  List<Widget> _buildLessonPathFromData(BuildContext context, List<ListLessonModel> lessons) {
    const rowHeight = 110.0;
    final widgets = <Widget>[];

    for (int i = 0; i < lessons.length; i++) {
      final lesson = lessons[i];
      final isLeft = i % 2 == 0; // четные слева, нечетные справа
      final status = _mapLessonStatus(lesson);

      widgets.add(
        SizedBox(
          height: rowHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               // левая сторона
               if (isLeft)
                 Expanded(
                   child: Align(
                     alignment: Alignment.centerRight,
                     child: Padding(
                       padding: const EdgeInsets.only(right: 20),
                       child: LessonLevelItem(
                         levelNumber: lesson.order ?? 0,
                         status: status,
                         isOnLeftSide: true,
                         onTap: () => _onLevelTap(context, lesson.order ?? 0, status, lesson.title ?? ''),
                       ),
                     ),
                   ),
                 )
               else
                 const Expanded(child: SizedBox()),

               // Убираем центральную линию
               const SizedBox(width: 0),

               // правая сторона
               if (!isLeft)
                 Expanded(
                   child: Align(
                     alignment: Alignment.centerLeft,
                     child: Padding(
                       padding: const EdgeInsets.only(left: 20),
                       child: LessonLevelItem(
                         levelNumber: lesson.order ?? 0,
                         status: status,
                         isOnLeftSide: false,
                         onTap: () => _onLevelTap(context, lesson.order ?? 0, status, lesson.title ?? ''),
                       ),
                     ),
                   ),
                 )
               else
                 const Expanded(child: SizedBox()),
            ],
          ),
        ),
      );
    }

    return widgets;
  }

  // Маппинг статуса урока
  LessonStatus _mapLessonStatus(ListLessonModel lesson) {
    if (!(lesson.available ?? false)) return LessonStatus.locked;
    if (lesson.isPassed ?? false) return LessonStatus.completed;
    if (lesson.isLesson ?? false) return LessonStatus.current;
    return LessonStatus.finalLesson;
  }

  void _onLevelTap(BuildContext context, int levelNumber, LessonStatus status, String title) {
    if (status == LessonStatus.locked) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Урок "$title" заблокирован.\nСначала пройдите предыдущие уроки.'),
          backgroundColor: Colors.grey,
          duration: const Duration(seconds: 3),
        ),
      );
      return;
    }

    if (status == LessonStatus.finalLesson) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('🎉 Финальный экзамен\nПройдите все уроки для доступа!'),
          backgroundColor: Colors.orange,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    final statusText = status == LessonStatus.completed ? 'Повторить' : 'Начать';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$statusText урок $levelNumber: "$title"'),
        backgroundColor: status == LessonStatus.completed
            ? const Color(0xFF58D68D)
            : const Color(0xFF1FB0C8),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: statusText.toUpperCase(),
          textColor: Colors.white,
          onPressed: () {
            // context.push('/lesson/$levelNumber');
          },
        ),
      ),
    );
  }
}
