// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RankModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankModel _$RankModelFromJson(Map<String, dynamic> json) => RankModel(
  completeLesson: (json['completed_lesson'] as num).toInt(),
  completedTest: (json['completed_test'] as num).toInt(),
  id: (json['id'] as num).toInt(),
  image: json['image'] as String,
  isCurrentUser: json['is_current_user'] as bool,
  rank: json['rank'] as String,
  tempRank: (json['temp_rank'] as num).toInt(),
  totalPoints: (json['total_points'] as num).toInt(),
  user: json['user'] as String,
);

Map<String, dynamic> _$RankModelToJson(RankModel instance) => <String, dynamic>{
  'completed_lesson': instance.completeLesson,
  'completed_test': instance.completedTest,
  'id': instance.id,
  'image': instance.image,
  'is_current_user': instance.isCurrentUser,
  'rank': instance.rank,
  'temp_rank': instance.tempRank,
  'total_points': instance.totalPoints,
  'user': instance.user,
};
