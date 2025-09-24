import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pdd_flutter_new_24_04_25/config/CommonState.dart';
import 'package:pdd_flutter_new_24_04_25/models/main/lesson/ListLessonModel.dart';
import '../../../../config/AppColors.dart';
import '../../../../config/appbar_custom.dart';
import 'constants/lesson_constants.dart';
import 'state/lesson_cubit.dart';
import 'state/test_cubit.dart';
import 'widgets/lesson_list.dart';
import 'widgets/lesson_state_widgets.dart';

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
        padding: const EdgeInsets.symmetric(
          horizontal: LessonConstants.screenPadding,
          vertical: LessonConstants.screenPadding,
        ),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create:
                  (_) => GetIt.instance<LessonCubit>()..lessonInfo(lessonId),
            ),
            BlocProvider(
              create: (_) => GetIt.instance<TestCubit>()..testInfo(lessonId),
            ),
          ],
          child: BlocConsumer<LessonCubit, CommonState<List<ListLessonModel>>>(
            listener: (context, state) {},
            builder: (context, state) {
              return switch (state) {
                Loading() => LessonStateWidgets.loading(),
                Success(:final data) => LessonList(
                  lessons: data,
                  lessonId: lessonId,
                ),
                Error(:final message) => LessonStateWidgets.error(message),
                _ => LessonStateWidgets.noData(),
              };
            },
          ),
        ),
      ),
    );
  }
}
