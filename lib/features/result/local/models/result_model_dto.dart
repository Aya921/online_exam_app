// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:exam_app/features/exam/api/model/questions_response/exam_dto.dart';
import 'package:exam_app/features/exam/api/model/questions_response/quesions_dto.dart';
import 'package:exam_app/features/exam/api/model/questions_response/question_answers_dto.dart';
import 'package:exam_app/features/exam/api/model/questions_response/subject_dto.dart';
import 'package:exam_app/features/result/api/models/check_response/check_response_dto.dart';
import 'package:exam_app/features/result/api/models/check_response/correct_question_dto.dart';
import 'package:exam_app/features/result/api/models/check_response/wrong_question_dto.dart';
import 'package:isar/isar.dart';
import 'package:exam_app/features/result/domain/entities/result_model.dart';

part 'result_model_dto.g.dart';

@Collection()
class ResultModelDto {
  Id id = Isar.autoIncrement;
  late List<QuestionsDto> questions;
  late CheckResponseDto answers;
  late int seconds;
  late int correct;

  ResultModel toModel() {
    return ResultModel(
      seconds: seconds,
      correct: correct,
      questions: questions.map((q) => q.toModel()).toList(),
      answers: answers.toModel(),
    );
  }

  static ResultModelDto toDto(ResultModel model) {
    return ResultModelDto()
      ..correct = model.correct
      ..questions = model.questions
          .map((modelQ) => QuestionsDto.toDto(modelQ))
          .toList()
      ..seconds = model.seconds
      ..answers = CheckResponseDto.toDto(model.answers);
  }
}
