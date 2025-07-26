import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';
import 'package:exam_app/features/auth/domin/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
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
  @JsonKey(name: JsonConstants.isVerified)
  bool? isVerified;
  @JsonKey(name: JsonConstants.id)
  String? id;
  @JsonKey(name: JsonConstants.createdAt)
  DateTime? createdAt;

  UserDto({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.id,
    this.createdAt,
  });

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);

  UserModel toUserModel() {
    return UserModel(
      username: username,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      email: email,
    );
  }
}
