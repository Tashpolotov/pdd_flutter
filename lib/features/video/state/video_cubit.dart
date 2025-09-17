
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_video_use_case.dart';
import 'package:pdd_flutter_new_24_04_25/models/video/CategoryModel.dart';

import '../../../config/CommonState.dart';

class VideoCubit extends Cubit<CommonState<List<CategoryModel>>> {
  final GetVideoUseCase _getVideoUseCase;

  VideoCubit(this._getVideoUseCase) : super(const CommonState.initial()) {
    videoInfo();
  }

  Future<void> videoInfo() async {
    emit(const CommonState.loading());

    try {
      final response = await _getVideoUseCase.execute();
      emit(CommonState.success(response));
    } catch (e) {
      emit(CommonState.error("Ошибка: ${e.toString()}"));
    }
  }
}