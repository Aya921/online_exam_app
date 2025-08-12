import 'package:exam_app/features/exam/api/model/questions_response/quesions_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';

part 'question_response.g.dart';

@JsonSerializable()
class QuesionsResponse {
  @JsonKey(name: JsonConstants.message)
  String? message;

  @JsonKey(name: JsonConstants.questions)
  List<QuestionsDto>? questions;

  QuesionsResponse({this.message, this.questions});

  factory QuesionsResponse.fromJson(Map<String, dynamic> json) =>
      _$QuesionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuesionsResponseToJson(this);
}
