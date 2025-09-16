// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProfileModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) => ProfileModel(
  user: json['user'] as String,
  image: json['image'] as String,
  completedLesson: (json['completed_lesson'] as num).toInt(),
  completedTest: (json['completed_test'] as num).toInt(),
  totalPoints: (json['total_points'] as num).toInt(),
  rank: json['rank'] as String,
  nextRank: json['next_rank'] as String,
  pointCount: (json['point_count'] as num).toInt(),
  pointsToNextRank: (json['points_to_next_rank'] as num).toInt(),
);

Map<String, dynamic> _$ProfileModelToJson(ProfileModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'image': instance.image,
      'completed_lesson': instance.completedLesson,
      'completed_test': instance.completedTest,
      'total_points': instance.totalPoints,
      'rank': instance.rank,
      'next_rank': instance.nextRank,
      'point_count': instance.pointCount,
      'points_to_next_rank': instance.pointsToNextRank,
    };
