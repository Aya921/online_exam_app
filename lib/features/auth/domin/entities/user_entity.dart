import 'package:exam_app/features/auth/api/model/user.dart';

class UserEntity {
  final String? id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? role;
  final bool? isVerified;
  final String? createdAt;
  final String? passwordChangedAt;

  UserEntity ({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.createdAt,
    this.passwordChangedAt,
  });


  factory UserEntity.fromUserDto(UserDto userDto) {
    return UserEntity(
      id: userDto.Id,
      username: userDto.username,
      firstName: userDto.firstName,
      lastName: userDto.lastName,
      email: userDto.email,
      phone: userDto.phone,
      role: userDto.role,
      isVerified: userDto.isVerified,
      createdAt: userDto.createdAt,
      passwordChangedAt: userDto.passwordChangedAt,
    );
  }


}