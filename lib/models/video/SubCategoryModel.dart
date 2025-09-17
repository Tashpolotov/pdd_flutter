import 'package:freezed_annotation/freezed_annotation.dart';

part 'SubCategoryModel.g.dart';

@JsonSerializable()
class SubCategoryModel {
  final int id;
  final String title;
  final String image;
  final int category;

  SubCategoryModel({
    required this.id,
    required this.title,
    required this.image,
    required this.category,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$SubCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$SubCategoryModelToJson(this);
}
