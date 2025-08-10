import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_password_body.g.dart';

@JsonSerializable()
class ChangePasswordBody {
  @JsonKey(name: JsonConstants.oldPassword)
  String? oldPassword;
  @JsonKey(name: JsonConstants.password)
  String? password;
  @JsonKey(name: JsonConstants.rePassword)
  String? rePassword;

  ChangePasswordBody({this.oldPassword, this.password, this.rePassword});

  factory ChangePasswordBody.fromJson(Map<String, dynamic> json) {
    return _$ChangePasswordBodyFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ChangePasswordBodyToJson(this);
}
