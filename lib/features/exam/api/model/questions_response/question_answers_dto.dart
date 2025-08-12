import 'package:exam_app/features/exam/domin/entity/questions_answers_model.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';
part 'question_answers_dto.g.dart';

@embedded
@JsonSerializable()
class QuestionsAnswersDto {
  @JsonKey(name: JsonConstants.answer)
  String? answer;
  @JsonKey(name: JsonConstants.key)
  String? key;

  QuestionsAnswersDto({this.answer, this.key});

  factory QuestionsAnswersDto.fromJson(Map<String, dynamic> json) =>
      _$QuestionsAnswersDtoFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsAnswersDtoToJson(this);

  QuestionsAnswersModel toModel() {
    return QuestionsAnswersModel(answer: answer, key: key);
  }

  static QuestionsAnswersDto toDto(QuestionsAnswersModel model) {
    return QuestionsAnswersDto(answer: model.answer, key: model.key);
  }
}
