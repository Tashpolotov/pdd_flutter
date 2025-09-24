import 'package:freezed_annotation/freezed_annotation.dart';

import '../level/PointsModel.dart';
part 'TestModel.g.dart';

@JsonSerializable()
class TestModel {
  final int id;
  final String? title;
  final bool? available;
  @JsonKey(name: 'is_passed')
  final bool? isPassed;
  final PointsModel? points;
  @JsonKey(name: 'is_test')
  final bool isTest;

  TestModel({
    required this.id,
    required this.isPassed,
    required this.title,
    required this.available,
    required this.isTest,
    required this.points,
  });

  factory TestModel.fromJson(Map<String, dynamic> json) => _$TestModelFromJson(json);

  Map<String, dynamic> toJson() => _$TestModelToJson(this);
}