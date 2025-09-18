import 'package:freezed_annotation/freezed_annotation.dart';
part 'PassedLessonModel.g.dart';

@JsonSerializable()
class PassedLessonModel {
  @JsonKey(name: 'user_lessons')
  final int userLesson;
  @JsonKey(name: 'level_lessons')
  final int levelLesson;

  PassedLessonModel({required this.levelLesson, required this.userLesson});

  factory PassedLessonModel.fromJson(Map<String, dynamic> json) => _$PassedLessonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PassedLessonModelToJson(this);

}
