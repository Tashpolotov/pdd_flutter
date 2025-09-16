
import 'package:json_annotation/json_annotation.dart';
part 'ChangeNameModel.g.dart';
@JsonSerializable()
class ChangeNameModel {
  @JsonKey(name: "username")
  final String changeName;

  ChangeNameModel({required this.changeName});

  factory ChangeNameModel.fromJson(Map<String, dynamic> json) =>
      _$ChangeNameModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeNameModelToJson(this);
}