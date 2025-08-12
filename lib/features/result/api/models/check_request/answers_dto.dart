import 'package:exam_app/features/result/domain/entities/answers_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'answers_dto.g.dart';

@JsonSerializable()
class AnswersDto {
  @JsonKey(name: "questionId")
  String? questionId;
  @JsonKey(name: "correct")
  String? correct;

  AnswersDto({this.questionId, this.correct});

  factory AnswersDto.fromJson(Map<String, dynamic> json) =>
      _$AnswersDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AnswersDtoToJson(this);

  static AnswersDto toDto(AnswersModel answersModel) {
   
    return AnswersDto(questionId: answersModel.questionId, correct: answersModel.correct);
  }
}
