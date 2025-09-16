
import 'package:pdd_flutter_new_24_04_25/models/profile/DeleteModel.dart';
import 'package:pdd_flutter_new_24_04_25/models/profile/ProfileModel.dart';
import 'package:pdd_flutter_new_24_04_25/services/pdd_api/api.dart';

class ProfileRepository {
  final PddApiClient apiClient;

  ProfileRepository({required this.apiClient});

  Future<ProfileModel> getUserInfo() async {
    try {
      final response = await apiClient.getUserInfo();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}



