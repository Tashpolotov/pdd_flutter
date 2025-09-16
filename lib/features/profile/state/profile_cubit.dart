import 'package:bloc/bloc.dart';
import 'package:pdd_flutter_new_24_04_25/config/CommonState.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_user_profile_use_case.dart';
import 'package:pdd_flutter_new_24_04_25/models/profile/ProfileModel.dart';

import '../../../config/AppToast.dart';

class ProfileCubit extends Cubit<CommonState<ProfileModel>> {
  final GetUserProfileUseCase _getUserProfileUseCase;

  ProfileCubit(this._getUserProfileUseCase)
    : super(const CommonState.initial()) {
    profileInfo();
  }

  Future<void> profileInfo() async {
    emit(const CommonState.loading());

    try {
      final response = await _getUserProfileUseCase.execute();
      emit(CommonState.success(response));
        } catch (e) {
      emit(CommonState.error("Ошибка: ${e.toString()}"));
    }
  }

  Future<void> deleteAccount() async {
    emit(const CommonState.loading());
    try {
      final result = await _getUserProfileUseCase.executeDelete();
      final msg = result.delete ??
          'Аккаунт успешно удалён';
      AppToast.show(message: msg);
      emit(const CommonState.initial());
    } catch (e) {
      emit(CommonState.error('Ошибка при удалении аккаунта: ${e.toString()}'));
    }
  }
  Future<void> changeUserName(String newName) async {
    try {
      final message = await _getUserProfileUseCase.executeChangeName(newName);
      AppToast.show(message: message);
      await profileInfo();
    } catch (e) {
      AppToast.show(message: 'Ошибка смены имени: ${e.toString()}');
    }
  }
}
