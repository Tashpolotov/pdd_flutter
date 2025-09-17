import 'package:freezed_annotation/freezed_annotation.dart';

part 'VideoModel.g.dart';

@JsonSerializable()
class VideoModel {
  final int id;
  final String title;
  @JsonKey(name: 'video_url')
  final String videoUrl;
  final int subcategory;
  @JsonKey(name: 'image_url')
  final String imageUrl;

  VideoModel({
    required this.title,
    required this.id,
    required this.imageUrl,
    required this.subcategory,
    required this.videoUrl,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);

  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}

