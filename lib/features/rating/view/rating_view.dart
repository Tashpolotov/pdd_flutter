import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppColors.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppTextStyle.dart';
import 'package:pdd_flutter_new_24_04_25/config/CommonState.dart';
import 'package:pdd_flutter_new_24_04_25/features/rating/state/rank_cubit.dart';
import 'package:pdd_flutter_new_24_04_25/models/rank/RankModel.dart';
import 'package:pdd_flutter_new_24_04_25/core/extensions/common_state_extensions.dart';
import 'package:pdd_flutter_new_24_04_25/core/extensions/context_extensions.dart';
import '../../../config/AppShimmer.dart';
import '../../../gen/assets.gen.dart';
import '../components/users_rating.dart';

class RatingView extends StatelessWidget {
  const RatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.app_background,
      body: BlocProvider(
        create: (_) => GetIt.instance<RankCubit>(),
        child: BlocConsumer<RankCubit, CommonState<List<RankModel>>>(
          listener: (context, state) {
            if (state.isError) {
              context.showErrorSnackBar(state.errorMessage!);
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Column(
                children: [
                  _buildHeader(_extractCurrentUser(state)),
                  Text("Рейтинг", style: AppTextStyle.text_22_black_500),
                  const SizedBox(height: 4),
                  Text(
                    "Лучшие по баллам",
                    style: AppTextStyle.text_12_color_A6A6A6_400,
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        context.read<RankCubit>().refresh();
                      },
                      child: state.when(
                        initial: () => const Center(),
                        loading: () => Center(child: AppShimmer.profileInfo()),
                        error: (message) => Center(child: Text('Ошибка: $message')),
                        success: (data) => data.isEmpty
                            ? const Center(child: Text("Нет данных для отображения"))
                            : ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  final user = data[index];
                                  return UsersRating(
                                    rankModel: user,
                                    position: index + 1,
                                    isCurrentUser: user.isCurrentUser,
                                  );
                                },
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  (RankModel?, int) _extractCurrentUser(CommonState<List<RankModel>> state) {
    final rankings = state.dataOrNull;
    if (rankings != null) {
      for (int i = 0; i < rankings.length; i++) {
        if (rankings[i].isCurrentUser) {
          return (rankings[i], i + 1);
        }
      }
    }
    return (null, 0);
  }

  Widget _buildHeader((RankModel?, int) userData) {
    final currentUser = userData.$1;
    final currentPosition = userData.$2;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 38),
                    SvgPicture.asset(Assets.icons.icStart.path),
                    const SizedBox(height: 5),
                    Text(
                      currentUser?.totalPoints.toString() ?? "0",
                      style: AppTextStyle.text_16_color_6E6E6E_500,
                    ),
                    const SizedBox(height: 5),
                    Text("Всего баллов", style: AppTextStyle.text_12_black_500),
                    const SizedBox(height: 5),
                    SvgPicture.asset(
                      Assets.images.icPlace2.path,
                      width: 94,
                      height: 52,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    SvgPicture.asset(Assets.icons.icStart.path),
                    const SizedBox(height: 5),
                    Text(
                      currentPosition.toString(),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: AppColors.btnColor,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Место в рейтинге",
                      style: AppTextStyle.text_12_black_500,
                    ),
                    const SizedBox(height: 5),
                    SvgPicture.asset(
                      Assets.images.icPlace2.path,
                      width: 112,
                      height: 88,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 38),
                    SvgPicture.asset(Assets.icons.icCompleteLesson.path),
                    const SizedBox(height: 5),
                    Text(
                      currentUser?.completeLesson.toString() ?? "0",
                      style: AppTextStyle.text_16_color_6E6E6E_500,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Пройдено уроков",
                      style: AppTextStyle.text_12_black_500,
                    ),
                    const SizedBox(height: 5),
                    SvgPicture.asset(
                      Assets.images.icPlace2.path,
                      width: 94,
                      height: 52,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16), // отступ
          const Divider(thickness: 2, color: Colors.red, height: 2),
        ],
      ),
    );
  }
}
