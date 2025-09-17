import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pdd_flutter_new_24_04_25/models/video/SubCategoryModel.dart';

part 'CategoryModel.g.dart';

@JsonSerializable()
class CategoryModel {
  final int id;
  final String title;
  final List<SubCategoryModel> subcategories;

  CategoryModel({
    required this.id,
    required this.title,
    required this.subcategories,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

