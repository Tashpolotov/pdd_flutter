import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppColors.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppTextStyle.dart';
import 'package:pdd_flutter_new_24_04_25/config/CommonState.dart';
import 'package:pdd_flutter_new_24_04_25/core/extensions/common_state_extensions.dart';
import 'package:pdd_flutter_new_24_04_25/core/extensions/context_extensions.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_video_use_case.dart';
import 'package:pdd_flutter_new_24_04_25/features/video/state/video_cubit.dart';
import 'package:pdd_flutter_new_24_04_25/features/video/components/category_pdd.dart';
import 'package:pdd_flutter_new_24_04_25/models/video/CategoryModel.dart';

class VideoView extends StatelessWidget {
  const VideoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.app_background,
      body: BlocProvider(
        create: (_) => GetIt.instance<VideoCubit>(),
        child: BlocConsumer<VideoCubit, CommonState<List<CategoryModel>>>(
          listener: (context, state) {
            if (state.isError) {
              context.showErrorSnackBar(state.errorMessage!);
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Категории видео',
                      style: AppTextStyle.text_22_black_500,
                    ),
                  ),
                  
                  Expanded(
                    child: switch (state) {
                      Loading() => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      Error(:final message) => Center(
                        child: Text(
                          'Ошибка: $message',
                          style: AppTextStyle.text_16_color_6E6E6E_500,
                        ),
                      ),
                      Success(:final data) when data.isEmpty => Center(
                        child: Text(
                          'Нет категорий для отображения',
                          style: AppTextStyle.text_16_color_6E6E6E_500,
                        ),
                      ),
                      Success(:final data) => ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return CategoryPdd(
                            categoryModel: data[index],
                            onSubcategoryTap: (subcategoryId) {
                              context.pushWithExtra('/video-detail', subcategoryId);
                            },
                          );
                        },
                      ),
                      _ => const SizedBox.shrink(),
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
}

