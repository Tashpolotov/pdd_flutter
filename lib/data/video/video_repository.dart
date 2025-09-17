
import 'package:pdd_flutter_new_24_04_25/models/video/CategoryModel.dart';
import 'package:pdd_flutter_new_24_04_25/models/video/VideoModel.dart';
import 'package:pdd_flutter_new_24_04_25/services/pdd_api/api.dart';

class VideoRepository {
  late final PddApiClient apiClient;

  VideoRepository({required this.apiClient});

  Future<List<CategoryModel>> getVideo() async {
    return await apiClient.getVideo();
  }

  Future<List<VideoModel>> getAllVideo(int subcategoryId) async {
    return await apiClient.getAllVideo(subcategoryId);
  }
}