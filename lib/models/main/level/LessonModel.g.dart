// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LessonModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonModel _$LessonModelFromJson(Map<String, dynamic> json) => LessonModel(
  id: (json['id'] as num).toInt(),
  available: json['available'] as bool,
  description: json['description'] as String,
  name: json['name'] as String,
  order: (json['order'] as num).toInt(),
  passedLesson: PassedLessonModel.fromJson(
    json['passed_lessons'] as Map<String, dynamic>,
  ),
  points: PointsModel.fromJson(json['points'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LessonModelToJson(LessonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'order': instance.order,
      'passed_lessons': instance.passedLesson,
      'points': instance.points,
      'available': instance.available,
    };
