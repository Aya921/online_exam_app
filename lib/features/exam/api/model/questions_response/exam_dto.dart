import 'package:exam_app/features/exam/domin/entity/exam_model.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';

part 'exam_dto.g.dart';
@embedded
@JsonSerializable()
class ExamDto {
  @JsonKey(name: JsonConstants.id)
  String? id;

  @JsonKey(name: JsonConstants.title)
  String? title;

  @JsonKey(name: JsonConstants.duration)
  int? duration;

  @JsonKey(name: JsonConstants.subject)
  String? subject;

  @JsonKey(name: JsonConstants.numberOfQuestions)
  int? numberOfQuestions;

  @JsonKey(name: JsonConstants.active)
  bool? active;

  @JsonKey(name: JsonConstants.createdAt)
  DateTime? createdAt;

  ExamDto({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory ExamDto.fromJson(Map<String, dynamic> json) =>
      _$ExamDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExamDtoToJson(this);

  ExamModel toModel() {
    return ExamModel(
      title: title,
      duration: duration,
      subject: subject,
      numberOfQuestions: numberOfQuestions,
      active: active,
      id: id,
    );
  }

  static ExamDto toDto(ExamModel model) {
    return ExamDto(
      title: model.title,
      duration: model.duration,
      numberOfQuestions: model.numberOfQuestions,
      active: model.active,
      id: model.id

    
    );
  }
}
