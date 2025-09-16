import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/CommonState.dart';
import '../../../../domain/get_user_usecase.dart';

class RegistrationCubit extends Cubit<CommonState<void>> {
  final GetUserUseCase _getUserUseCase;

  RegistrationCubit(this._getUserUseCase) : super(const CommonState.initial());

  Future<void> registerUser(String username) async {
    if (username.isEmpty) {
      emit(const CommonState.error("Имя не может быть пустым"));
      return;
    }

    emit(const CommonState.loading());
    await Future.delayed(const Duration(seconds: 2));
    try {
      final response = await _getUserUseCase.execute(username);

      if (response != null) {
        emit(const CommonState.success(null));
      } else {
        emit(const CommonState.error("Ошибка регистрации"));
      }
    } catch (e) {
      emit(CommonState.error("Ошибка: ${e.toString()}"));
    }
  }
}