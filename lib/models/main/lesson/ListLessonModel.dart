import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pdd_flutter_new_24_04_25/models/main/level/PointsModel.dart';
part 'ListLessonModel.g.dart';

@JsonSerializable()
class ListLessonModel {
  final int id;
  final String title;
  final int order;
  final bool available;
  @JsonKey(name: 'is_passed')
  final bool isPassed;
  final PointsModel poinsts;
  @JsonKey(name: 'is_lesson')
  final bool isLesson;
  @JsonKey(name: 'level_name')
  final String levelName;

  ListLessonModel({
    required this.order,
    required this.available,
    required this.id,
    required this.title,
    required this.isLesson,
    required this.isPassed,
    required this.levelName,
    required this.poinsts,
  });

  factory ListLessonModel.fromJson(Map<String, dynamic> json) => _$ListLessonModelFromJson(json);
  Map<String, dynamic> toJson() => _$ListLessonModelToJson(this);
}
