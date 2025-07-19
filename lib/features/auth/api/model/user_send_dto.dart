
import 'package:exam_app/features/auth/domin/entities/user_entity.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';
import 'dart:convert';

part 'user_send_dto.g.dart';

UserSendDto userSendDtoFromJson(String str) => UserSendDto.fromJson(json.decode(str));

String userSendDtoToJson(UserSendDto data) => json.encode(data.toJson());

@JsonSerializable()
class UserSendDto {
    @JsonKey(name:JsonConstants.username) 
    String? username;
    @JsonKey(name: JsonConstants.firstName)
    String? firstName;
    @JsonKey(name: JsonConstants.lastName)
    String? lastName;
    @JsonKey(name: JsonConstants.email)
    String? email;
    @JsonKey(name: JsonConstants.password)
    String? password;
    @JsonKey(name: JsonConstants.repassword)
    String? rePassword;
    @JsonKey(name: JsonConstants.phone)
    String? phone;

    UserSendDto({
        this.username,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.rePassword,
        this.phone,
    });


    factory UserSendDto.fromJson(Map<String, dynamic> json) => _$UserSendDtoFromJson(json);

    Map<String, dynamic> toJson() => _$UserSendDtoToJson(this);
    static UserSendDto toDto(UserModel usermodel) {
    return UserSendDto(

      firstName: usermodel.firstName,
      lastName: usermodel.lastName,
      email: usermodel.email,
      phone: usermodel.phone,
      username: usermodel.username,
      password: usermodel.password,
      rePassword: usermodel.repassword





    );
  }



}
