import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metadata_dto.g.dart';

@JsonSerializable()
class MetadataDto {
  @JsonKey(name: JsonConstants.currentPage)
  int? currentPage;
  @JsonKey(name: JsonConstants.numberOfPages)
  int? numberOfPages;
  @JsonKey(name: JsonConstants.limit)
  int? limit;

  MetadataDto({this.currentPage, this.numberOfPages, this.limit});

  factory MetadataDto.fromJson(Map<String, dynamic> json) {
    return _$MetadataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MetadataDtoToJson(this);
}
