import 'package:exam_app/features/auth/domin/entities/signup_req.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';
import 'dart:convert';

part 'signup_request_dto.g.dart';

SignUpRequestDto signupRequesDtotFromJson(String str) =>
    SignUpRequestDto.fromJson(json.decode(str));

String signupRequestDtoToJson(SignUpRequestDto data) =>
    json.encode(data.toJson());

@JsonSerializable()
class SignUpRequestDto {
  @JsonKey(name: JsonConstants.username)
  String? username;
  @JsonKey(name: JsonConstants.firstName)
  String? firstName;
  @JsonKey(name: JsonConstants.lastName)
  String? lastName;
  @JsonKey(name: JsonConstants.email)
  String? email;
  @JsonKey(name: JsonConstants.password)
  String? password;
  @JsonKey(name: JsonConstants.repassword)
  String? rePassword;
  @JsonKey(name: JsonConstants.phone)
  String? phone;

  SignUpRequestDto({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });

  factory SignUpRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestDtoToJson(this);

  static SignUpRequestDto toDto(SignupRequest usermodel) {
    return SignUpRequestDto(
      firstName: usermodel.firstName,
      lastName: usermodel.lastName,
      email: usermodel.email,
      phone: usermodel.phone,
      username: usermodel.username,
      password: usermodel.password,
      rePassword: usermodel.repassword,
    );
  }
}
