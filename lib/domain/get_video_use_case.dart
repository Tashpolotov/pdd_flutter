
import 'package:pdd_flutter_new_24_04_25/data/video/video_repository.dart';
import 'package:pdd_flutter_new_24_04_25/models/video/CategoryModel.dart';

class GetVideoUseCase {
  final VideoRepository repository;

  GetVideoUseCase(this.repository);

  Future<List<CategoryModel>> execute() async {
    return await repository.getVideo();
  }
}