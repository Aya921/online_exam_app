
import 'package:exam_app/features/auth/domin/entities/signin_req.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';
import 'dart:convert';

part 'signin_request_dto.g.dart';

SigninRequestDto signupRequesDtotFromJson(String str) => SigninRequestDto.fromJson(json.decode(str));

String signinRequestDtoToJson(SigninRequestDto data) => json.encode(data.toJson());

@JsonSerializable()
class SigninRequestDto {
   
    @JsonKey(name: JsonConstants.email)
    String? email;
    @JsonKey(name: JsonConstants.password)
    String? password;
  

    SigninRequestDto({
       
        this.email,
        this.password,
       
    });


    factory SigninRequestDto.fromJson(Map<String, dynamic> json) => _$SigninRequestDtoFromJson(json);

    Map<String, dynamic> toJson() => _$SigninRequestDtoToJson(this);



    static SigninRequestDto toDto(SignInRequest usermodel) {
    return SigninRequestDto(

      
      email: usermodel.email,
    
      password: usermodel.password,
   





    );
  }



}
