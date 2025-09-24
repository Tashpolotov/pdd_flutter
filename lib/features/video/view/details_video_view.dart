import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppColors.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppRoutes.dart';
import 'package:pdd_flutter_new_24_04_25/config/CommonState.dart';
import 'package:pdd_flutter_new_24_04_25/config/appbar_custom.dart';
import 'package:pdd_flutter_new_24_04_25/core/extensions/common_state_extensions.dart';
import 'package:pdd_flutter_new_24_04_25/core/extensions/context_extensions.dart';
import 'package:pdd_flutter_new_24_04_25/features/video/state/video_all_cubit.dart';
import 'package:pdd_flutter_new_24_04_25/models/video/VideoModel.dart';
import '../components/video_component.dart';

class DetailsVideoView extends StatefulWidget {
  const DetailsVideoView({super.key});

  @override
  State<DetailsVideoView> createState() => _DetailsVideoViewState();
}

class _DetailsVideoViewState extends State<DetailsVideoView> {
  @override
  Widget build(BuildContext context) {
    final subcategoryId = GoRouterState.of(context).extra as int? ?? 0;

    return Scaffold(
      backgroundColor: AppColors.app_background,
      appBar: AppbarCustom(titleAppBar: "Смотреть видео"),
      body: BlocProvider(create: (_) => GetIt.instance<VideoAllCubit>()..getVideos(subcategoryId),
        child: BlocConsumer<VideoAllCubit, CommonState<List<VideoModel>>>(
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
                    Text('Ошибка: $message'),
                    ElevatedButton(
                      onPressed: () => context.read<VideoAllCubit>().refresh(),
                      child: const Text('Повторить'),
                    ),
                  ],
                ),
              ),
              Success(:final data) when data.isEmpty => const Center(
                child: Text('Нет видео в данной категории'),
              ),
              Success(:final data) => SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Видео подкатегории $subcategoryId',
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: VideoComponent(
                        videos: data,
                        onVideoTap: (video) {
                          context.push(
                            AppRoutes.videoPlayerPath,
                            extra: video,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              _ => const SizedBox.shrink(),
            };
          },
        ),
      ),
    );
  }
}
