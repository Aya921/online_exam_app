// To parse this JSON data, do
//
//     final signupResponse = signupResponseFromJson(jsonString);

import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';
import 'package:exam_app/features/auth/api/model/user_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'signup_response.g.dart';

SignupResponse signupResponseFromJson(String str) => SignupResponse.fromJson(json.decode(str));

String signupResponseToJson(SignupResponse data) => json.encode(data.toJson());

@JsonSerializable()
class SignupResponse {
    @JsonKey(name: JsonConstants.message)
    String? message;
    @JsonKey(name:JsonConstants.token) 
    String? token;
    @JsonKey(name: JsonConstants.user)
    UserDto? user;

    SignupResponse({
        this.message,
        this.token,
        this.user,
    });

    factory SignupResponse.fromJson(Map<String, dynamic> json) => _$SignupResponseFromJson(json);

    Map<String, dynamic> toJson() => _$SignupResponseToJson(this);

    
}
