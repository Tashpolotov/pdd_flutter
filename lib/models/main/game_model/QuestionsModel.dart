import 'package:freezed_annotation/freezed_annotation.dart';

import 'AnswerModel.dart';
part 'QuestionsModel.g.dart';

@JsonSerializable()
class QuestionsModel {
  final int id;
  final String image;
  final String explanation;
  final String title;
  final int order;
  final List<AnswerModel> answers;

  QuestionsModel({
    required this.title,
    required this.id,
    required this.order,
    required this.image,
    required this.explanation,
    required this.answers,
  });

  factory QuestionsModel.fromJson(Map<String, dynamic> json) => _$QuestionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsModelToJson(this);
}

