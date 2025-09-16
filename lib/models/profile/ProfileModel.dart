import 'package:json_annotation/json_annotation.dart';

part 'ProfileModel.g.dart';

@JsonSerializable()
class ProfileModel {
  final String user;
  final String image;
  @JsonKey(name: 'completed_lesson')
  final int completedLesson;
  @JsonKey(name: 'completed_test')
  final int completedTest;
  @JsonKey(name: 'total_points')
  final int totalPoints;
  final String rank;
  @JsonKey(name: 'next_rank')
  final String nextRank;
  @JsonKey(name: 'point_count')
  final int pointCount;
  @JsonKey(name: 'points_to_next_rank')
  final int pointsToNextRank;

  ProfileModel({
    required this.user,
    required this.image,
    required this.completedLesson,
    required this.completedTest,
    required this.totalPoints,
    required this.rank,
    required this.nextRank,
    required this.pointCount,
    required this.pointsToNextRank,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);
}
