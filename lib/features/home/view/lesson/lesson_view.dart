import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/AppColors.dart';
import '../../../../config/appbar_custom.dart';
import 'components/lesson_level_item.dart';
import 'components/lesson_path_connector.dart';


class LessonView extends StatelessWidget {
  const LessonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.app_background,
      appBar: AppbarCustom(
        titleAppBar: "Название уровня (тема)",
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(children: _buildLessonPath(context)),
      ),
    );
  }

  List<Widget> _buildLessonPath(BuildContext context) {
    final levels = [
      {'number': 1, 'status': LessonStatus.completed, 'isLeft': true,  'title': 'Знакомство с ПД123Д'},
      {'number': 2, 'status': LessonStatus.completed, 'isLeft': false, 'title': 'Дорожные знаки'},
      {'number': 3, 'status': LessonStatus.completed, 'isLeft': true,  'title': 'Светофоры'},
      {'number': 4, 'status': LessonStatus.current,   'isLeft': false, 'title': 'Разметка дороги'},
      {'number': 5, 'status': LessonStatus.locked,    'isLeft': true,  'title': 'Проезд перекрестков'},
      {'number': 6, 'status': LessonStatus.locked,    'isLeft': false, 'title': 'Обгон и опережение'},
      {'number': 7, 'status': LessonStatus.locked,    'isLeft': true,  'title': 'Остановка и стоянка'},
      {'number': 8, 'status': LessonStatus.locked,    'isLeft': false, 'title': 'Пешеходные переходы'},
      {'number': 9, 'status': LessonStatus.locked,    'isLeft': true,  'title': 'Движение в городе'},
      {'number':10, 'status': LessonStatus.locked,    'isLeft': false, 'title': 'Безопасность движения'},
      {'number': 0, 'status': LessonStatus.finalLesson,'isLeft': true, 'title': 'Финальный экзамен'},
    ];

    const rowHeight = 110.0; // чуть выше чтобы енот помещался
    final widgets = <Widget>[];

    for (int i = 0; i < levels.length; i++) {
      final level = levels[i];
      final isLeft = level['isLeft'] as bool;
      final status = level['status'] as LessonStatus;
      final number = level['number'] as int;
      final title  = level['title']  as String;

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
                         levelNumber: number,
                         status: status,
                         isOnLeftSide: true,
                         onTap: () => _onLevelTap(context, number, status, title),
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
                         levelNumber: number,
                         status: status,
                         isOnLeftSide: false,
                         onTap: () => _onLevelTap(context, number, status, title),
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
