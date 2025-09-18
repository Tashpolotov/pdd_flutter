import 'package:freezed_annotation/freezed_annotation.dart';
part 'PointsModel.g.dart';

@JsonSerializable()
class PointsModel {
  @JsonKey(name: 'user_points')
  final int? userPoints;
  @JsonKey(name: 'level_points')
  final int? levelPoints;

  PointsModel({this.userPoints, this.levelPoints});

  factory PointsModel.fromJson(Map<String, dynamic> json) => _$PointsModelFromJson(json);
  Map<String, dynamic> toJson() => _$PointsModelToJson(this);
}

