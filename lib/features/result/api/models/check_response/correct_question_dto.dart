import 'package:exam_app/features/result/domain/entities/correct_question_model.dart';
import 'package:isar/isar.dart';

import 'package:json_annotation/json_annotation.dart';
part 'correct_question_dto.g.dart';
@embedded
@JsonSerializable()
class CorrectQuestionDto {
  @JsonKey(name: "QID")
  String? qid;
  @JsonKey(name: "Question")
  String? question;
  @JsonKey(name: "correctAnswer")
  String? correctAnswer;
  @JsonKey(name: "answers")
  @ignore
  dynamic answers;

  CorrectQuestionDto({
    this.qid,
    this.question,
    this.correctAnswer,
    this.answers,
  });

  factory CorrectQuestionDto.fromJson(Map<String, dynamic> json) =>
      _$CorrectQuestionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CorrectQuestionDtoToJson(this);

  CorrectQuestionModel toModel() {
   
    return CorrectQuestionModel(
      qid: qid,
      question: question,
      correctAnswer: correctAnswer,
      answers: answers == null || (answers as Map).isEmpty ? [] : [],
    );
  }

  static CorrectQuestionDto toDto(CorrectQuestionModel model) {
    return CorrectQuestionDto(
      qid: model.qid,
      question: model.question,
      correctAnswer: model.correctAnswer,
      answers: model.answers,
    );
  }
}
