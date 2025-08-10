import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';
import 'package:exam_app/features/exam/api/model/subject_response/metadata_dto.dart';
import 'package:json_annotation/json_annotation.dart';

import '../exam_dto.dart';

part 'get_all_exams_on_subject.g.dart';

@JsonSerializable()
class GetAllExamsOnSubject {
  @JsonKey(name: JsonConstants.message)
  String? message;
  @JsonKey(name: JsonConstants.metadata)
  MetadataDto? metadata;
  @JsonKey(name: JsonConstants.exams)
  List<ExamDto>? exams;

  GetAllExamsOnSubject({this.message, this.metadata, this.exams});

  factory GetAllExamsOnSubject.fromJson(Map<String, dynamic> json) {
    return _$GetAllExamsOnSubjectFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllExamsOnSubjectToJson(this);
}
