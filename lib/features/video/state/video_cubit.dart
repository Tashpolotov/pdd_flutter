
import 'package:pdd_flutter_new_24_04_25/core/base/base_cubit.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_video_use_case.dart';
import 'package:pdd_flutter_new_24_04_25/models/video/CategoryModel.dart';

class VideoCubit extends BaseCubit<List<CategoryModel>> {
  final GetVideoUseCase _getVideoUseCase;

  VideoCubit(this._getVideoUseCase) {
    videoInfo();
  }

  void videoInfo() {
    safeExecute(() => _getVideoUseCase.execute());

  }

  @override
  void refresh() {
    videoInfo();
  }
}