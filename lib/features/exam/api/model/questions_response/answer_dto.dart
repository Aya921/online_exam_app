import 'package:exam_app/features/exam/domin/entity/answer_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';
part 'answer_dto.g.dart';


@JsonSerializable()
class AnswerDto {
  @JsonKey(name: JsonConstants.answer)
  String? answer;
  @JsonKey(name: JsonConstants.key)
  String? key;

  AnswerDto({this.answer, this.key});

  factory AnswerDto.fromJson(Map<String, dynamic> json) =>
      _$AnswerDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerDtoToJson(this);

   AnswerModel toModel( ) {
    return AnswerModel(
      answer: answer,
      key: key,
    );
  }
}
