import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppTextStyle.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppToast.dart';
import 'package:pdd_flutter_new_24_04_25/config/App_dialog.dart';
import 'package:pdd_flutter_new_24_04_25/config/CommonState.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_user_profile_use_case.dart';
import 'package:pdd_flutter_new_24_04_25/features/profile/components/lesson_complete.dart';
import 'package:pdd_flutter_new_24_04_25/features/profile/state/profile_cubit.dart';
import 'package:pdd_flutter_new_24_04_25/models/profile/ProfileModel.dart';
import '../../../config/AppColors.dart';
import '../../../config/AppRoutes.dart';
import '../../../config/AppShimmer.dart';
import '../../../config/NameInputDialog.dart';
import '../../../gen/assets.gen.dart';
import '../../../generated/l10n.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.app_background,
      body: BlocProvider(
        create:
            (context) => ProfileCubit(context.read<GetUserProfileUseCase>()),
        child: BlocConsumer<ProfileCubit, CommonState<ProfileModel>>(
          listener: (context, state) {
            if (state is Error) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text((state as Error).message)));
            }
          },
          builder: (context, state) {
            ProfileModel? profile;
            bool isLoading = false;

            if (state is Loading) {
              isLoading = true;
            } else if (state is Success<ProfileModel>) {
              profile = state.data;
            }

            return Stack(
              children: [
                Positioned(
                  top: 18,
                  right: 16,
                  child: InkWell(
                    onTap: () {
                      AppToast.show(message: "Открыть настройки");
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(Assets.icons.icSetting.path),
                    ),
                  ),
                ),
                Positioned(
                  top: 32,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset(Assets.images.imgEnotProfile.path),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                profile?.user ?? 'Загрузка...',
                                style: AppTextStyle.text_20_black_500,
                              ),
                            ),
                            const SizedBox(width: 16),
                            InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => NameInputDialog(
                                    onCancel: () {
                                      Navigator.of(context).pop();
                                    },
                                    onDone: (name) {
                                      Navigator.of(context).pop();
                                      if (name.trim().isNotEmpty) {
                                        context.read<ProfileCubit>().changeUserName(name.trim());
                                      } else {
                                        AppToast.show(message: 'Имя не может быть пустым');
                                      }
                                    },

                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: SvgPicture.asset(
                                  Assets.icons.icPencil.path,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        isLoading
                            ? AppShimmer.profileInfo()
                            : _rankCard(profile),
                        const SizedBox(height: 8),
                        isLoading
                            ? AppShimmer.lessonComplete()
                            : LessonComplete(
                              ball: profile?.totalPoints.toString() ?? '0',
                              nameBall: 'Всего баллов',
                              imgConst: Assets.icons.icStart.path,
                            ),
                        const SizedBox(height: 8),
                        isLoading
                            ? AppShimmer.lessonComplete()
                            : LessonComplete(
                              ball: profile?.completedLesson.toString() ?? '0',
                              nameBall: 'Пройдено уроков',
                              imgConst: Assets.icons.icStart.path,
                            ),
                        const SizedBox(height: 8),
                        isLoading
                            ? AppShimmer.lessonComplete()
                            : LessonComplete(
                              ball: profile?.completedTest.toString() ?? '0',
                              nameBall: 'Пройдено тестов',
                              imgConst: Assets.icons.icStart.path,
                            ),
                        const SizedBox(height: 32),

                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (_) => AppDialog(
                                title: S.of(context)!.are_sure_delete_profile,
                                subtitle: S.of(context)!.delete_you_statistic,
                                confirmText: S.of(context)!.delete,
                                cancelText: S.of(context)!.cansel,
                                onConfirm: () {
                                  Navigator.of(context).pop();
                                  context.go(AppRoutes.registrationPath);
                                },
                                onCancel: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            );
                          },
                          child: Text(
                            S.of(context)!.delete_account,
                            style: TextStyle(fontSize: 14, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

Widget _rankCard(ProfileModel? profile) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    padding: const EdgeInsets.all(14.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(Assets.icons.icRank.path),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile?.rank ?? '--',
                    style: AppTextStyle.text_16_gold_400,
                  ),
                  Text('Ранг', style: AppTextStyle.text_12_color_A6A6A6_400),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          height: 16,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('0', style: AppTextStyle.text_12_color_A6A6A6_400),
            Text(
              '${profile?.nextRank ?? '--'} ед.',
              style: AppTextStyle.text_12_color_A6A6A6_400,
            ),
          ],
        ),
      ],
    ),
  );
}


