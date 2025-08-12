import 'package:exam_app/features/result/api/models/check_request/answers_dto.dart';
import 'package:exam_app/features/result/domain/entities/student_answer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'student_answers_dto.g.dart';

@JsonSerializable()
class StudentAnswerDto {
  @JsonKey(name: "answers")
  List<AnswersDto>? answers;
  @JsonKey(name: "time")
  int? time;

  StudentAnswerDto({this.answers, this.time});

  factory StudentAnswerDto.fromJson(Map<String, dynamic> json) =>
      _$StudentAnswerDtoFromJson(json);

  Map<String, dynamic> toJson() => _$StudentAnswerDtoToJson(this);

  static StudentAnswerDto toDto(StudentAnswer studentAnswer) {
  
    return StudentAnswerDto(
  answers: studentAnswer.answers!
      .map((answer) => AnswersDto.toDto(answer))
      .toList(),
  time: studentAnswer.time,
);

  }
}
