// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PointsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PointsModel _$PointsModelFromJson(Map<String, dynamic> json) => PointsModel(
  userPoints: (json['user_points'] as num?)?.toInt(),
  levelPoints: (json['level_points'] as num?)?.toInt(),
);

Map<String, dynamic> _$PointsModelToJson(PointsModel instance) =>
    <String, dynamic>{
      'user_points': instance.userPoints,
      'level_points': instance.levelPoints,
    };
