import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../config/AppColors.dart';
import '../../../config/AppRoutes.dart';
import '../../../config/CommonState.dart';
import '../../../config/appbar_custom.dart';
import '../../../domain/get_level_use_case.dart';
import '../../../gen/assets.gen.dart';
import '../../../generated/l10n.dart';
import '../../../models/main/level/LessonModel.dart';
import '../components/LevelProgressCard.dart';
import '../state/level_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.app_background,
      appBar: AppbarCustom(
        titleAppBar: "Home",
        showBackButton: false,
      ),
      body: BlocProvider(
        create: (context) => LevelCubit(context.read<GetLevelUseCase>()),
        child: BlocConsumer<LevelCubit, CommonState<List<LessonModel>>>(
          listener: (context, state) {
            if (state is Error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text((state as Error).message)),
              );
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Приветственный текст
                  Padding(
                    padding: const EdgeInsets.only(top: 12, right: 24, left: 24),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Text(
                          S.of(context)!.hello_i_am_enot_pdd,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),

                  // Ёнот (кликабельный)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: GestureDetector(
                      onTap: () {
                        context.push(AppRoutes.profilePath);
                      },
                      child: SvgPicture.asset(
                        Assets.images.onboard1.path,
                        width: double.infinity,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),

                  // Контент в зависимости от состояния
                  Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 16),
                    child: switch (state) {
                      Loading() => const SizedBox(
                        height: 240,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                      Error(:final message) => Column(
                        children: [
                          Text(
                            'Ошибка: $message',
                            style: TextStyle(color: Colors.red),
                          ),
                          SizedBox(height: 16),
                          _buildStaticLevels(context), // Fallback к статичным данным
                        ],
                      ),
                      Success(:final data) when data.isNotEmpty => _buildLevelsFromData(context, data),
                      _ => _buildStaticLevels(context), // Initial state или пустые данные
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLevelsFromData(BuildContext context, List<LessonModel> lessons) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: 250.h,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.90),
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          final lesson = lessons[index];
          bool isFirstOrLast = index == 0 || index == lessons.length - 1;

          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isFirstOrLast ? 0 : 8
            ),
            child: LevelProgressCard(
              level: lesson.name,
              theme: lesson.description,
              progressText: "${lesson.points?.userPoints ?? 0} из ${lesson.points.levelPoints ?? 1}",
              progressValue: (lesson.points?.userPoints ?? 0) / (lesson.points.levelPoints ?? 1),
              lessonsText: "Пройдено уроков: ${lesson.passedLesson.userLesson} из ${lesson.passedLesson.levelLesson}",
                onSeeLessonsPressed: () {
                  context.push(AppRoutes.lessonPath, extra: lesson.id);
                },
            ),
          );
        },
      ),
    );
  }

  Widget _buildStaticLevels(BuildContext context) {
    return SizedBox(
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.90),
        itemCount: 5,
        itemBuilder: (context, index) {
          bool isFirstOrLast = index == 0 || index == 4;
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isFirstOrLast ? 0 : 8,
            ),
            child: LevelProgressCard(
              level: "Уровень ${index + 1}",
              theme: "Тема: Общее положение",
              progressText: "${(index + 1) * 40} из 200",
              progressValue: (index + 1) / 5,
              lessonsText: "Пройдено уроков: ${index + 1} из 10",
                onSeeLessonsPressed: () {
                  context.push(AppRoutes.lessonPath);
                },
            ),
          );
        },
      ),
    );
  }
}