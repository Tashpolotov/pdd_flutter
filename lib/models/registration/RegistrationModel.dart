import 'package:json_annotation/json_annotation.dart';
part 'RegistrationModel.g.dart';

@JsonSerializable()
class RegistrationModel {
  final String user;
  final String refresh;
  final String access;

  RegistrationModel({
    required this.user,
    required this.refresh,
    required this.access
  });
  factory RegistrationModel.fromJson(Map<String, dynamic> json) => _$RegistrationModelFromJson(json);

  Map<String, dynamic> toJson() => _$RegistrationModelToJson(this);
}
