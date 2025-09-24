import '../../models/profile/ProfileModel.dart';

/// Extension методы для моделей данных
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


