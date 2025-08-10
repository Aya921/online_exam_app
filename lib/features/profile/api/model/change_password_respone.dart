class ChangePasswordRespone {
  String? message;
  String? token;

  ChangePasswordRespone({this.message, this.token});

  factory ChangePasswordRespone.fromJson(Map<String, dynamic> json) {
    return ChangePasswordRespone(
      message: json['message'] as String?,
      token: json['token'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'message': message, 'token': token};
}
