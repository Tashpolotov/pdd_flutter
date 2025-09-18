// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TestModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestModel _$TestModelFromJson(Map<String, dynamic> json) => TestModel(
  id: (json['id'] as num).toInt(),
  isPassed: json['is_passed'] as bool?,
  title: json['title'] as String?,
  available: json['available'] as bool?,
  isTest: json['is_test'] as bool,
  points:
      json['points'] == null
          ? null
          : PointsModel.fromJson(json['points'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TestModelToJson(TestModel instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'available': instance.available,
  'is_passed': instance.isPassed,
  'points': instance.points,
  'is_test': instance.isTest,
};
