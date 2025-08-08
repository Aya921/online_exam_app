// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:exam_app/features/exam/api/model/subject_response/exam_dto.dart';
import 'package:isar/isar.dart';
import 'package:exam_app/features/result/domain/entities/result_model.dart';

part 'result_model_dto.g.dart';


@Collection()
class ResultModelDto {
  Id id = Isar.autoIncrement;
  late ExamDto exam;
  late String subjectName;
  late double seconds;
  late int correct;

  ResultModel toModel() {
    return ResultModel(
      subjectName: subjectName,
      seconds: seconds,
      correct: correct,
       exam: exam.toExamModel(),
    );
  }

  static ResultModelDto toDto(ResultModel model) {
    return ResultModelDto()
      ..correct = model.correct
       ..exam = ExamDto.toDto(model.exam)
      ..seconds = model.seconds
      ..subjectName = model.subjectName;
  }
}
