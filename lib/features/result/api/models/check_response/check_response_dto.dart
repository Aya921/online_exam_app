// To parse this JSON data, do
//
//     final checkResponse = checkResponseFromJson(jsonString);

import 'package:exam_app/features/result/api/models/check_response/correct_question_dto.dart';
import 'package:exam_app/features/result/api/models/check_response/wrong_question_dto.dart';
import 'package:exam_app/features/result/domain/entities/check_response_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'check_response_dto.g.dart';

@JsonSerializable()
class CheckResponseDto {
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "correct")
  int? correct;
  @JsonKey(name: "wrong")
  int? wrong;
  @JsonKey(name: "total")
  String? total;
  @JsonKey(name: "WrongQuestions")
  List<WrongQuestionDto>? wrongQuestions;
  @JsonKey(name: "correctQuestions")
  List<CorrectQuestionDto>? correctQuestions;

  CheckResponseDto({
    this.message,
    this.correct,
    this.wrong,
    this.total,
    this.wrongQuestions,
    this.correctQuestions,
  });

  factory CheckResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CheckResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CheckResponseDtoToJson(this);

  CheckResponseModel toModel() {
   
    return CheckResponseModel(
      message: message,
      correct: correct,
      wrong: wrong,
      total: total,
      wrongQuestions: wrongQuestions!.map((q) => q.toModel()).toList(),
      correctQuestions: correctQuestions!.map((q) => q.toModel()).toList(),
    );
  }
}
