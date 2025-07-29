import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';
import 'package:exam_app/features/exam/domin/entity/subject_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject_dto.g.dart';

@JsonSerializable()
class SubjectDto {
  @JsonKey(name: JsonConstants.id)
  String? id;
  @JsonKey(name: JsonConstants.name)
  String? name;
  @JsonKey(name: JsonConstants.icon)
  String? icon;
  @JsonKey(name: JsonConstants.createdAt)
  DateTime? createdAt;

  SubjectDto({this.id, this.name, this.icon, this.createdAt});

  factory SubjectDto.fromJson(Map<String, dynamic> json) {
    return _$SubjectDtoFromJson(json);
  }

  SubjectModel toSubjectModel() {
    return SubjectModel(id: id, name: name, icon: icon);
  }

  Map<String, dynamic> toJson() => _$SubjectDtoToJson(this);
}
