// To parse this JSON data, do
//
//     final questionsDto = quesionsResponseFromJson(jsonString);

import 'package:exam_app/features/exam/api/model/questions_response/question_answers_dto.dart';
import 'package:exam_app/features/exam/api/model/questions_response/exam_dto.dart';
import 'package:exam_app/features/exam/api/model/questions_response/subject_dto.dart';
import 'package:exam_app/features/exam/domin/entity/question_model.dart';

import 'package:exam_app/features/exam/domin/entity/subject_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';

part 'quesions_dto.g.dart';

@JsonSerializable()
class QuestionsDto {
  @JsonKey(name: JsonConstants.answers)
  List<QuestionsAnswersDto>? answers;

  @JsonKey(name: JsonConstants.type)
  String? type;

  @JsonKey(name: JsonConstants.id)
  String? id;

  @JsonKey(name: JsonConstants.question)
  String? question;

  @JsonKey(name: JsonConstants.correct)
  String? correct;

  @JsonKey(name: JsonConstants.subject)
  SubjectDto? subject;

  @JsonKey(name: JsonConstants.exam)
  ExamDto? exam;

  @JsonKey(name: JsonConstants.createdAt)
  DateTime? createdAt;

  QuestionsDto({
    this.answers,
    this.type,
    this.id,
    this.question,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  factory QuestionsDto.fromJson(Map<String, dynamic> json) =>
      _$QuestionsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsDtoToJson(this);
  QuestionsModel toModel() {
    return QuestionsModel(
      answers: answers!.map((dto) => dto.toModel()).toList(),
      type: type!,
      question: question!,
      correct: correct!,
      exam: exam!.toModel(),
      id: id,
      subject: subject?.toModel() ?? SubjectModel(),
    );
  }
}
