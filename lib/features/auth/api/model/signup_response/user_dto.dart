import 'package:exam_app/features/auth/domin/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_dto.g.dart';

@JsonSerializable()
class UserDto {
  @JsonKey(name: "username")
  String? username;
  @JsonKey(name: "firstName")
  String? firstName;
  @JsonKey(name: "lastName")
  String? lastName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "isVerified")
  bool? isVerified;
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "createdAt")
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

  UserModel toUserModel(String givenToken) {
    return UserModel(
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      email: email,
      token: givenToken,

    );
  }

  
}
