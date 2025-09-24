
import 'package:freezed_annotation/freezed_annotation.dart';

part 'AnswerModel.g.dart';

@JsonSerializable()
class AnswerModel {
  final int id;
  final String text;
  final bool? isCorrect;

  AnswerModel({required this.id, required this.isCorrect, required this.text});

  factory AnswerModel.fromJson(Map<String, dynamic> json) => _$AnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerModelToJson(this);
}