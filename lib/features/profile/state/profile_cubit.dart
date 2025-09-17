import 'package:bloc/bloc.dart';
import 'package:pdd_flutter_new_24_04_25/config/CommonState.dart';
import 'package:pdd_flutter_new_24_04_25/domain/get_user_profile_use_case.dart';
import 'package:pdd_flutter_new_24_04_25/models/profile/ProfileModel.dart';

import '../../../config/AppToast.dart';

extension ProfileModelExtension on ProfileModel {
  ProfileModel copyWith({
    String? user,
    String? image,
    int? completedLesson,
    int? completedTest,
    int? totalPoints,
    String? rank,
    String? nextRank,
    int? pointCount,
    int? pointsToNextRank,
  }) {
    return ProfileModel(
      user: user ?? this.user,
      image: image ?? this.image,
      completedLesson: completedLesson ?? this.completedLesson,
      completedTest: completedTest ?? this.completedTest,
      totalPoints: totalPoints ?? this.totalPoints,
      rank: rank ?? this.rank,
      nextRank: nextRank ?? this.nextRank,
      pointCount: pointCount ?? this.pointCount,
      pointsToNextRank: pointsToNextRank ?? this.pointsToNextRank,
    );
  }
}

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
      final msg = result.delete.isNotEmpty ? result.delete : 'Аккаунт успешно удалён';
      AppToast.show(message: msg);
      emit(const CommonState.initial());
    } catch (e) {
      emit(CommonState.error('Ошибка при удалении аккаунта: ${e.toString()}'));
    }
  }
  Future<void> changeUserName(String newName) async {
    final currentState = state;
    if (currentState is! Success<ProfileModel>) return;
    
    final currentProfile = currentState.data;
    
    final updatedProfile = ProfileModel(
      user: newName,
      rank: currentProfile.rank,
      nextRank: currentProfile.nextRank,
      totalPoints: currentProfile.totalPoints,
      completedLesson: currentProfile.completedLesson,
      completedTest: currentProfile.completedTest,
      image: currentProfile.image,
      pointCount: currentProfile.pointCount,
      pointsToNextRank: currentProfile.pointsToNextRank,
    );
    
    emit(CommonState.success(updatedProfile));
    
    try {
      final message = await _getUserProfileUseCase.executeChangeName(newName);
    } catch (e) {
      emit(CommonState.success(currentProfile));
      AppToast.show(message: 'Ошибка смены имени: ${e.toString()}');
    }
  }
}
