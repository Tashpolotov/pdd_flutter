// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'VideoModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => VideoModel(
  title: json['title'] as String,
  id: (json['id'] as num).toInt(),
  imageUrl: json['image_url'] as String,
  subcategory: (json['subcategory'] as num).toInt(),
  videoUrl: json['video_url'] as String,
);

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'video_url': instance.videoUrl,
      'subcategory': instance.subcategory,
      'image_url': instance.imageUrl,
    };
