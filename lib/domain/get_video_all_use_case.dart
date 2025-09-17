
import 'package:pdd_flutter_new_24_04_25/data/video/video_repository.dart';
import 'package:pdd_flutter_new_24_04_25/models/video/VideoModel.dart';

class GetVideoAllUseCase {
  final VideoRepository repository;

  GetVideoAllUseCase(this.repository);

  Future<List<VideoModel>> execute(int subcategoryId) async {
    return await repository.getAllVideo(subcategoryId);
  }
}
