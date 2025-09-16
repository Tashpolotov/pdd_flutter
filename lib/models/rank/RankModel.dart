import 'package:json_annotation/json_annotation.dart';

part 'RankModel.g.dart';

@JsonSerializable()
class RankModel {
  @JsonKey(name: 'completed_lesson')
  final int completeLesson;
  @JsonKey(name: 'completed_test')
  final int completedTest;
  final int id;
  final String image;
  @JsonKey(name: 'is_current_user')
  final bool isCurrentUser;
  final String rank;
  @JsonKey(name: 'temp_rank')
  final int tempRank;
  @JsonKey(name: 'total_points')
  final int totalPoints;
  final String user;

  RankModel({
    required this.completeLesson,
    required this.completedTest,
    required this.id,
    required this.image,
    required this.isCurrentUser,
    required this.rank,
    required this.tempRank,
    required this.totalPoints,
    required this.user,
  });

  factory RankModel.fromJson(Map<String, dynamic> json) =>
      _$RankModelFromJson(json);

  Map<String, dynamic> toJson() => _$RankModelToJson(this);
}