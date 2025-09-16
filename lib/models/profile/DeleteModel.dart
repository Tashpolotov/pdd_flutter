import 'package:json_annotation/json_annotation.dart';
part 'DeleteModel.g.dart';

@JsonSerializable()
class DeleteModel {
  @JsonKey(name: "delete")
  final String delete;

  DeleteModel({required this.delete});

  factory DeleteModel.fromJson(Map<String, dynamic> json) => _$DeleteModelFromJson(json);

  Map<String, dynamic> toJdon() => _$DeleteModelToJson(this);
}
