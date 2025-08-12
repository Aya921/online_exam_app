import 'package:json_annotation/json_annotation.dart';

import 'user_dto.dart';

part 'profile_data_respone.g.dart';

@JsonSerializable()
class ProfileDataRespone {
  String? message;
  UserDto? user;

  ProfileDataRespone({this.message, this.user});

  factory ProfileDataRespone.fromJson(Map<String, dynamic> json) {
    return _$ProfileDataResponeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ProfileDataResponeToJson(this);
}
