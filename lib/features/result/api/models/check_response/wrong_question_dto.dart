
import 'package:exam_app/features/result/domain/entities/wrong_question_model.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
part 'wrong_question_dto.g.dart';
@embedded
@JsonSerializable()
class WrongQuestionDto {
  @JsonKey(name: "QID")
  String? qid;
  @JsonKey(name: "Question")
  String? question;
  @JsonKey(name: "inCorrectAnswer")
  String? inCorrectAnswer;
  @JsonKey(name: "correctAnswer")
  String? correctAnswer;
  @JsonKey(name: "answers")
  @ignore
  dynamic answers;

  WrongQuestionDto({
    this.qid,
    this.question,
    this.inCorrectAnswer,
    this.correctAnswer,
    this.answers,
  });

  factory WrongQuestionDto.fromJson(Map<String, dynamic> json) =>
      _$WrongQuestionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WrongQuestionDtoToJson(this);

  WrongQuestionModel toModel() {
    return WrongQuestionModel(
      qid: qid,
      question: question,
      inCorrectAnswer: inCorrectAnswer,
      correctAnswer: correctAnswer,
      answers: answers == null || (answers as Map).isEmpty
        ? []:[]
       
    );
  }

   static WrongQuestionDto toDto(WrongQuestionModel model) {
    return WrongQuestionDto(
      qid: model.qid,
      question: model.question,
      inCorrectAnswer: model.inCorrectAnswer,
      correctAnswer: model.correctAnswer,
      answers: model.answers,
    );
  }
}
