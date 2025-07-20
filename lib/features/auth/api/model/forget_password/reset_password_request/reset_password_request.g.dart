// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResetPassword _$ResetPasswordFromJson(Map<String, dynamic> json) =>
    ResetPassword(
      email: json['email'] as String?,
      newPassword: json['newPassword'] as String?,
    );

Map<String, dynamic> _$ResetPasswordToJson(ResetPassword instance) =>
    <String, dynamic>{
      'email': instance.email,
      'newPassword': instance.newPassword,
    };
