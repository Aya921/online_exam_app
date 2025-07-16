// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SignInRespones.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SigninRespones _$SigninResponesFromJson(Map<String, dynamic> json) =>
    SigninRespones(
      message: json['message'] as String?,
      token: json['token'] as String?,
      user: json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SigninResponesToJson(SigninRespones instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'user': instance.user,
    };
