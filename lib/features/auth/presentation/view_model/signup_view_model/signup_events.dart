import 'package:exam_app/features/auth/domin/entities/user_entity.dart';

abstract class SignupEvent {}

class SignUpUserEvent extends SignupEvent{
  final UserModel userModel;

  SignUpUserEvent(this.userModel);
}


class ValidateSignupEvent extends SignupEvent {}