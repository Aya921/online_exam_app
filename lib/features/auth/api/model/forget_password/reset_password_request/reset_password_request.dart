import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reset_password_request.g.dart';

@JsonSerializable()
class ResetPassword {
  @JsonKey(name: JsonConstants.email)
  String? email;
  @JsonKey(name: JsonConstants.newPassword)
  String? newPassword;

  ResetPassword({this.email, this.newPassword});

  factory ResetPassword.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResetPasswordToJson(this);
}
