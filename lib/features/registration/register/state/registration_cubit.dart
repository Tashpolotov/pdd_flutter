import 'package:flutter/foundation.dart';
import '../../../../config/CommonState.dart';
import '../../../../core/base/base_cubit.dart';
import '../../../../domain/get_user_usecase.dart';

class RegistrationCubit extends BaseCubit<void> {
  final GetUserUseCase _getUserUseCase;

  RegistrationCubit(this._getUserUseCase);

  /// Регистрация пользователя
  Future<void> registerUser(String username) async {
    if (username.isEmpty) {
      emit(const CommonState.error("Имя не может быть пустым"));
      return;
    }

    safeExecute(() async {
      await Future.delayed(const Duration(seconds: 2));
      final response = await _getUserUseCase.execute(username);
      
      if (response == null) {
        throw Exception("Ошибка регистрации");
      }
      
      return; // void return
    });
  }

  /// Обновление данных (refresh)
  @override
  void refresh() {
    // Для регистрации refresh не нужен
  }
}