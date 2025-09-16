// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RegistrationModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationModel _$RegistrationModelFromJson(Map<String, dynamic> json) =>
    RegistrationModel(
      user: json['user'] as String,
      refresh: json['refresh'] as String,
      access: json['access'] as String,
    );

Map<String, dynamic> _$RegistrationModelToJson(RegistrationModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'refresh': instance.refresh,
      'access': instance.access,
    };
