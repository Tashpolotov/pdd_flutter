import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pdd_flutter_new_24_04_25/models/main/level/PassedLessonModel.dart';
import 'package:pdd_flutter_new_24_04_25/models/main/level/PointsModel.dart';
part 'LessonModel.g.dart';

@JsonSerializable()
class LessonModel {
  final int id;
  final String name;
  final String description;
  final int order;
  @JsonKey(name: 'passed_lessons')
  final PassedLessonModel passedLesson;
  final PointsModel points;
  final bool available;

  LessonModel({
    required this.id,
    required this.available,
    required this.description,
    required this.name,
    required this.order,
    required this.passedLesson,
    required this.points,
  });

  factory LessonModel.fromJson(Map<String, dynamic> json) => _$LessonModelFromJson(json);

  Map<String, dynamic> toJson() => _$LessonModelToJson(this);
}


