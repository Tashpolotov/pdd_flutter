// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'QuestionsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionsModel _$QuestionsModelFromJson(Map<String, dynamic> json) =>
    QuestionsModel(
      title: json['title'] as String,
      id: (json['id'] as num).toInt(),
      order: (json['order'] as num).toInt(),
      image: json['image'] as String,
      explanation: json['explanation'] as String,
      answers:
          (json['answers'] as List<dynamic>)
              .map((e) => AnswerModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$QuestionsModelToJson(QuestionsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'explanation': instance.explanation,
      'title': instance.title,
      'order': instance.order,
      'answers': instance.answers,
    };
