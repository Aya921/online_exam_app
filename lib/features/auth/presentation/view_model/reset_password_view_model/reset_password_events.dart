


import 'package:exam_app/features/auth/domin/entities/reset_password_req.dart';

abstract class ResetPasswordEvents {}

class ResetNewPasswordEvent extends ResetPasswordEvents {
  final ResetPasswordRequest resetPasswordRequest;

  ResetNewPasswordEvent(this.resetPasswordRequest);
}

class ValidateResetPasswordEvent extends ResetPasswordEvents {
 
}



