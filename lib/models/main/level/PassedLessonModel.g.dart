// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PassedLessonModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PassedLessonModel _$PassedLessonModelFromJson(Map<String, dynamic> json) =>
    PassedLessonModel(
      levelLesson: (json['level_lessons'] as num).toInt(),
      userLesson: (json['user_lessons'] as num).toInt(),
    );

Map<String, dynamic> _$PassedLessonModelToJson(PassedLessonModel instance) =>
    <String, dynamic>{
      'user_lessons': instance.userLesson,
      'level_lessons': instance.levelLesson,
    };
