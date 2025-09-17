import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppColors.dart';
import 'package:pdd_flutter_new_24_04_25/config/AppRoutes.dart';
import 'package:pdd_flutter_new_24_04_25/config/CommonState.dart';
import 'package:pdd_flutter_new_24_04_25/config/appbar_custom.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_video_all_use_case.dart';
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
      appBar: AppbarCustom(titleAppBar: "ивдео сооав"),
      body: BlocProvider(
        create: (context) =>
        VideoAllCubit(context.read<GetVideoAllUseCase>())
          ..getVideos(subcategoryId),
        child: BlocConsumer<VideoAllCubit, CommonState<List<VideoModel>>>(
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

            if (state is Success<List<VideoModel>>) {
              final videos = state.data;
              return SafeArea(
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
                        videos: videos,
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
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
