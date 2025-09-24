import 'package:pdd_flutter_new_24_04_25/core/extensions/common_state_extensions.dart';
import 'package:pdd_flutter_new_24_04_25/core/extensions/model_extensions.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_user_profile_use_case.dart';
import 'package:pdd_flutter_new_24_04_25/models/profile/ProfileModel.dart';

import '../../../config/AppToast.dart';
import '../../../config/CommonState.dart';
import '../../../core/base/base_cubit.dart';

class ProfileCubit extends BaseCubit<ProfileModel> {
  final GetUserProfileUseCase _getUserProfileUseCase;

  ProfileCubit(this._getUserProfileUseCase) {
    loadProfile();
  }

  void loadProfile() {
    safeExecute(() => _getUserProfileUseCase.execute());
  }

  Future<void> deleteAccount() async {
    safeExecute(() async {
      final result = await _getUserProfileUseCase.executeDelete();
      final msg = result.delete.isNotEmpty ? result.delete : 'Аккаунт успешно удалён';
      AppToast.show(message: msg);
      return ProfileModel(
        user: '',
        rank: '',
        nextRank: '',
        totalPoints: 0,
        completedLesson: 0,
        completedTest: 0,
        image: '',
        pointCount: 0,
        pointsToNextRank: 0,
      );
    });
  }
  Future<void> changeUserName(String newName) async {
    final currentProfile = state.dataOrNull;
    if (currentProfile == null) return;
    
    final updatedProfile = currentProfile.copyWith(user: newName);
    emit(CommonState.success(updatedProfile));
    
    try {
      await _getUserProfileUseCase.executeChangeName(newName);
      AppToast.show(message: 'Имя успешно изменено');
    } catch (e) {
      emit(CommonState.success(currentProfile));
      AppToast.show(message: 'Ошибка смены имени: ${e.toString()}');
    }
  }

  @override
  void refresh() {
    loadProfile();
  }
}
