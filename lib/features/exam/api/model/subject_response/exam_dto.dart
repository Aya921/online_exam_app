import 'package:exam_app/features/exam/domin/entity/exam_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exam_dto.g.dart';

@JsonSerializable()
class ExamDto {
  @JsonKey(name: '_id')
  String? id;
  String? title;
  int? duration;
  String? subject;
  int? numberOfQuestions;
  bool? active;
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

  ExamModel toExamModel() {
    return ExamModel(
      id: id,
      title: title,
      duration: duration,
      subject: subject,
      numberOfQuestions: numberOfQuestions,
      active: active,
    );
  }

  Map<String, dynamic> toJson() => _$ExamDtoToJson(this);
}
