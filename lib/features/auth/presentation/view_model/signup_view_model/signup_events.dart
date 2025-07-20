import 'package:exam_app/features/auth/domin/entities/signup_req.dart';


abstract class SignupEvent {}

class SignUpUserEvent extends SignupEvent{
  final SignupRequest signupRequest;

  SignUpUserEvent(this.signupRequest);
}


class ValidateSignupEvent extends SignupEvent {}