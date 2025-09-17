

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdd_flutter_new_24_04_25/config/CommonState.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_video_all_use_case.dart';
import 'package:pdd_flutter_new_24_04_25/models/video/VideoModel.dart';

class VideoAllCubit extends Cubit<CommonState<List<VideoModel>>> {
  final GetVideoAllUseCase _getVideoAllUseCase;

  VideoAllCubit(this._getVideoAllUseCase) : super(const CommonState.initial());

  Future<void> getVideos(int subcategoryId) async {
    emit(const CommonState.loading());

    try {
      final response = await _getVideoAllUseCase.execute(subcategoryId);
      emit(CommonState.success(response));
    } catch (e) {
      emit(CommonState.error("Ошибка: ${e.toString()}"));
    }
  }
}