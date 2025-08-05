import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';
import 'package:json_annotation/json_annotation.dart';

import '../metadata_dto.dart';
import '../subject_dto.dart';

part 'get_all_subjects_respone.g.dart';

@JsonSerializable()
class GetAllSubjectsRespone {
  @JsonKey(name: JsonConstants.message)
  String? message;
  @JsonKey(name: JsonConstants.metadata)
  MetadataDto? metadata;
  @JsonKey(name: JsonConstants.subjects)
  List<SubjectDto>? subjects;

  GetAllSubjectsRespone({this.message, this.metadata, this.subjects});

  factory GetAllSubjectsRespone.fromJson(Map<String, dynamic> json) {
    return _$GetAllSubjectsResponeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllSubjectsResponeToJson(this);
}
