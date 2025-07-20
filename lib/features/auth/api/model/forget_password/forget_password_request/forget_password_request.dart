import 'dart:convert';

import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forget_password_request.g.dart';

@JsonSerializable()
class ForgetPasswordRequest {
  @JsonKey(name: JsonConstants.email)
  String? email;

  ForgetPasswordRequest({this.email});

  factory ForgetPasswordRequest.fromJson(Map<String, dynamic> json) {
    return _$ForgetPasswordRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ForgetPasswordRequestToJson(this);
}
