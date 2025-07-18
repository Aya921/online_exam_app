import 'package:exam_app/features/auth/api/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'SignInRespones.g.dart';

@JsonSerializable()
class SigninRespones {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "token")
  final String? token;
  @JsonKey(name: "user")
  final UserDto? user;

  SigninRespones ({
    this.message,
    this.token,
    this.user,
  });

  factory SigninRespones.fromJson(Map<String, dynamic> json) {
    return _$SigninResponesFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SigninResponesToJson(this);
  }
}
