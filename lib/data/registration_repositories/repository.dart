import 'package:dio/dio.dart';
import 'package:pdd_flutter_new_24_04_25/config/SharedPrefsHelper.dart';

import '../../models/registration/RegistrationModel.dart';
import '../../models/registration/UserModel.dart';
import '../../services/pdd_api/api.dart';

class RegistrationRepository {
  final PddApiClient apiClient;

  RegistrationRepository({required this.apiClient});

  Future<RegistrationModel> getUser(String username) async {
    try {
      final response = await apiClient.getUser(UserModel(username: username));
      String accessToken = response.access.toString();
      SharedPrefsHelper.setToken(accessToken);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
