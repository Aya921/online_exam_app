import 'package:exam_app/features/exam/domin/entity/subject_model.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';
part 'subject_dto.g.dart';
@embedded
@JsonSerializable()
class SubjectDto {
  @JsonKey(name: JsonConstants.id)
  String? id;

  @JsonKey(name: JsonConstants.name)
  String? name;

  @JsonKey(name: JsonConstants.icon)
  String? icon;

  @JsonKey(name: JsonConstants.createdAt)
  @ignore
  DateTime? createdAt;

  SubjectDto({this.id, this.name, this.icon, this.createdAt});

  factory SubjectDto.fromJson(Map<String, dynamic> json) =>
      _$SubjectDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectDtoToJson(this);

  SubjectModel toModel() {
    return SubjectModel(name: name, icon: icon, id: id);
  }

  static SubjectDto toDto(SubjectModel model) {
    return SubjectDto(
      name: model.name,
      icon: model.icon,
      id: model.id
    );
  }
}
