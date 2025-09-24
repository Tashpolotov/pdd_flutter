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
      print('🚀 Отправляем регистрацию для пользователя: $username');
      final userModel = UserModel(username: username);
      print('📦 UserModel JSON: ${userModel.toJson()}');
      
      final response = await apiClient.getUser(userModel);
      
      print('✅ Успешный ответ от сервера');
      String accessToken = response.access.toString();
      SharedPrefsHelper.setToken(accessToken);
      return response;
    } catch (e) {
      print('❌ Ошибка регистрации: $e');
      if (e is DioException) {
        print('📊 Status Code: ${e.response?.statusCode}');
        print('📝 Response data: ${e.response?.data}');
        print('🔗 Request URL: ${e.requestOptions.uri}');
        print('📤 Request data: ${e.requestOptions.data}');
      }
      rethrow;
    }
  }
}
