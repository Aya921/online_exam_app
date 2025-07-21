import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';
import 'package:exam_app/features/auth/domin/entities/verfity_code_req.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_reset_code_request.g.dart';

@JsonSerializable()
class VerifyResetCodeRequestDto {
  @JsonKey(name: JsonConstants.resetCode)
  String? resetCode;

  VerifyResetCodeRequestDto({this.resetCode});

  factory VerifyResetCodeRequestDto.fromJson(Map<String, dynamic> json) {
    return _$VerifyResetCodeRequestDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$VerifyResetCodeRequestDtoToJson(this);

  static VerifyResetCodeRequestDto toDto(VerifyResetCodeRequest codeReq) {
    return VerifyResetCodeRequestDto(resetCode: codeReq.code);
  }
}
