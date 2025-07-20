import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_code_request.g.dart';

@JsonSerializable()
class VerifyResetCodeRequest {
  @JsonKey(name: JsonConstants.resetCode)
  String? resetCode;

  VerifyResetCodeRequest({this.resetCode});

  factory VerifyResetCodeRequest.fromJson(Map<String, dynamic> json) {
    return _$VerifyResetCodeRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VerifyResetCodeRequestToJson(this);
}
