// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AnswerModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerModel _$AnswerModelFromJson(Map<String, dynamic> json) => AnswerModel(
  id: (json['id'] as num).toInt(),
  isCorrect: json['isCorrect'] as bool?,
  text: json['text'] as String,
);

Map<String, dynamic> _$AnswerModelToJson(AnswerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'text': instance.text,
      'isCorrect': instance.isCorrect,
    };
