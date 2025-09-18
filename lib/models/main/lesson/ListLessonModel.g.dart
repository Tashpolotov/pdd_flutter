// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ListLessonModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListLessonModel _$ListLessonModelFromJson(Map<String, dynamic> json) =>
    ListLessonModel(
      order: (json['order'] as num).toInt(),
      available: json['available'] as bool,
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      isLesson: json['is_lesson'] as bool,
      isPassed: json['is_passed'] as bool,
      levelName: json['level_name'] as String,
      poinsts: PointsModel.fromJson(json['poinsts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListLessonModelToJson(ListLessonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'order': instance.order,
      'available': instance.available,
      'is_passed': instance.isPassed,
      'poinsts': instance.poinsts,
      'is_lesson': instance.isLesson,
      'level_name': instance.levelName,
    };
