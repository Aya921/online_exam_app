import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';
import 'package:exam_app/features/exam/domin/entity/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  @JsonKey(name: '_id')
  String? id;
  @JsonKey(name: JsonConstants.username)
  String? username;
  @JsonKey(name: JsonConstants.firstName)
  String? firstName;
  @JsonKey(name: JsonConstants.lastName)
  String? lastName;
  @JsonKey(name: JsonConstants.email)
  String? email;
  @JsonKey(name: JsonConstants.phone)
  String? phone;
  @JsonKey(name: JsonConstants.role)
  String? role;

  UserDto({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
  });

  UserEntity ToUserEtntity() {
    return UserEntity(
      id: id,
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
    );
  }

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}
