import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'forget_password_respone.g.dart';

@JsonSerializable()
class ForgetPasswordRespone {
  @JsonKey(name: JsonConstants.message)
  String? message;
  @JsonKey(name: JsonConstants.token)
  String? token;

  ForgetPasswordRespone({this.message, this.token});

  factory ForgetPasswordRespone.fromJson(Map<String, dynamic> json) {
    return _$ForgetPasswordResponeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ForgetPasswordResponeToJson(this);
}
