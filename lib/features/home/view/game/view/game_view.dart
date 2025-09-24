import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppButton.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppColors.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppDivider.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppRoutes.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppTextStyle.dart';
import 'package:pdd_flutter_new_24_04_25/config/CommonState.dart';
import 'package:pdd_flutter_new_24_04_25/core/extensions/common_state_extensions.dart';
import 'package:pdd_flutter_new_24_04_25/core/extensions/context_extensions.dart';
import 'package:pdd_flutter_new_24_04_25/features/home/view/game/components/bottom_sheet_answer.dart';
import 'package:pdd_flutter_new_24_04_25/features/home/view/game/components/qestions_component.dart';
import 'package:pdd_flutter_new_24_04_25/features/home/view/game/state/questions_cubit.dart';
import 'package:pdd_flutter_new_24_04_25/models/main/game_model/QuestionsModel.dart';

import '../../../../../config/App_dialog.dart';
import '../../../../../gen/assets.gen.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends State<GameView> {
  int? selectedIndex;
  int currentQuestionIndex = 0;
  final List<int> selectedAnswers = [];

  @override
  Widget build(BuildContext context) {
    final routeExtra = GoRouterState.of(context).extra as Map<String, dynamic>?;
    final lessonId = routeExtra?['lessonId'] as int? ?? 6;
    final levelId = routeExtra?['levelId'] as int? ?? 47;

    return Scaffold(
      backgroundColor: AppColors.app_background,
      appBar: AppBar(
        backgroundColor: AppColors.levelColorBackground,
        centerTitle: true,
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
        title: Row(
          children: [
            GestureDetector(
              onTap:
                  () => {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder:
                          (_) => AppDialog(
                            title: "Вы уверены, что хотите выйти?",
                            subtitle: 'Прогресс не будет сохранён.',
                            confirmText: 'Выйти',
                            cancelText: 'Продолжить',
                            onConfirm: () {
                              context.go(AppRoutes.lessonPath);
                            },
                            onCancel: () {
                              Navigator.of(context).pop();
                            },
                          ),
                    ),
                  },
              child: SvgPicture.asset(Assets.images.arrowLeft.path, height: 24),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: 0.2,
                  minHeight: 16,
                  backgroundColor: Colors.white,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Colors.orange,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create:
            (_) =>
                GetIt.instance<QuestionsCubit>()
                  ..getQuestions(lessonId, levelId),
        child: BlocConsumer<QuestionsCubit, CommonState<List<QuestionsModel>>>(
          listener: (context, state) {
            if (state.isError) {
              context.showErrorSnackBar(state.errorMessage!);
            }
          },
          builder: (context, state) {
            return switch (state) {
              Loading() => const Center(child: CircularProgressIndicator()),
              Error(:final message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ошибка: $message',
                      style: AppTextStyle.text_16_color_6E6E6E_400,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.h),
                    AppButton(
                      buttonText: "Повторить",
                      onClick: () => context.read<QuestionsCubit>().refresh(),
                    ),
                  ],
                ),
              ),
              Success(:final data) => _buildGameContent(data),
              _ => const Center(child: Text("Загружаем вопросы...")),
            };
          },
        ),
      ),
    );
  }

  Widget _buildGameContent(List<QuestionsModel> questions) {
    if (questions.isEmpty) {
      return const Center(child: Text("Нет вопросов для отображения"));
    }

    // берём текущий вопрос
    final currentQuestion = questions[currentQuestionIndex];
    final questionText = currentQuestion.title;
    final questionAnswers = currentQuestion.answers;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Container(
                width: double.infinity,
                height: 180.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(color: AppColors.btnColor, width: 2.w),
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.network(
                    currentQuestion.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6, left: 16, right: 16),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 24,
                ),
                child: Center(
                  child: Text(
                    questionText,
                    style: AppTextStyle.text_14_black_500,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 46.h),
          AppDivider(indent: 16, endIndent: 16),

          Expanded(
            child: ListView.builder(
              itemCount: questionAnswers.length,
              itemBuilder: (context, index) {
                final answer = questionAnswers[index];
                return Center(
                  child: QuestionsComponent(
                    questionsText: answer.text,
                    isSelected: selectedIndex == index,
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (_) => BottomSheetAnswer(
                            statusText: "Верно", title: "vjkjltdsf", buttonText: "Понятно"
                          ));
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16.h),

          AppButton(
            buttonText:
                currentQuestionIndex < questions.length - 1
                    ? "Продолжить"
                    : "Завершить",
            onClick:
                selectedIndex == null
                    ? null
                    : () {
                      setState(() {
                        selectedAnswers.add(questionAnswers[selectedIndex!].id);

                        if (currentQuestionIndex < questions.length - 1) {
                          currentQuestionIndex++;
                          selectedIndex = null;
                        } else {
                          context.push(AppRoutes.resultPath);
                        }
                      });
                    },
          ),
        ],
      ),
    );
  }
}
