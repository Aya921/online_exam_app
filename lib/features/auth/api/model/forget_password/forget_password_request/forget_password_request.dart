import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';
import 'package:exam_app/features/auth/domin/entities/forgot_password_req.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forget_password_request.g.dart';

@JsonSerializable()
class ForgetPasswordRequestDto {
  @JsonKey(name: JsonConstants.email)
  String? email;

  ForgetPasswordRequestDto({this.email});

  factory ForgetPasswordRequestDto.fromJson(Map<String, dynamic> json) {
    return _$ForgetPasswordRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ForgetPasswordRequestDtoToJson(this);

  static ForgetPasswordRequestDto toDto(ForgotPasswordRequset request) {
    return ForgetPasswordRequestDto(email: request.email);
  }
}
