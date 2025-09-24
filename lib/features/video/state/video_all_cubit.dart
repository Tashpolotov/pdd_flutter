import 'package:pdd_flutter_new_24_04_25/core/base/base_cubit.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_video_all_use_case.dart';
import 'package:pdd_flutter_new_24_04_25/models/video/VideoModel.dart';

class VideoAllCubit extends BaseCubit<List<VideoModel>> {
  final GetVideoAllUseCase _getVideoAllUseCase;
  int? _currentSubcategoryId;

  VideoAllCubit(this._getVideoAllUseCase);
  
  void getVideos(int subcategoryId) {
    _currentSubcategoryId = subcategoryId;
    safeExecute(() => _getVideoAllUseCase.execute(subcategoryId));
  }

  @override
  void refresh() {
    if (_currentSubcategoryId != null) {
      getVideos(_currentSubcategoryId!);
    }
  }
}
