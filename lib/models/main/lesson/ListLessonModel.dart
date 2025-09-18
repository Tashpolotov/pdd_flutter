import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pdd_flutter_new_24_04_25/models/main/level/PointsModel.dart';
part 'ListLessonModel.g.dart';

@JsonSerializable()
class ListLessonModel {
  final int? id;
  final String? title;
  final int? order;
  final bool? available;

  @JsonKey(name: 'is_passed')
  final bool? isPassed;

  final PointsModel? points;

  @JsonKey(name: 'is_lesson')
  final bool? isLesson;

  @JsonKey(name: 'level_name')
  final String? levelName;

  ListLessonModel({
    this.order,
    this.available,
    this.id,
    this.title,
    this.isLesson,
    this.isPassed,
    this.levelName,
    this.points,
  });

  factory ListLessonModel.fromJson(Map<String, dynamic> json) =>
      _$ListLessonModelFromJson(json);
  Map<String, dynamic> toJson() => _$ListLessonModelToJson(this);
}
