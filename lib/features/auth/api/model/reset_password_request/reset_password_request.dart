import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';
import 'package:exam_app/features/auth/domin/entities/reset_password_req.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request.g.dart';

@JsonSerializable()
class ResetPasswordDto {
  @JsonKey(name: JsonConstants.email)
  String? email;
  @JsonKey(name: JsonConstants.newPassword)
  String? newPassword;

  ResetPasswordDto({this.email, this.newPassword});

  factory ResetPasswordDto.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResetPasswordDtoToJson(this);

  static ResetPasswordDto toDto(ResetPasswordRequest passreq) {
    return ResetPasswordDto(email: passreq.email, newPassword: passreq.newPass);
  }
}
