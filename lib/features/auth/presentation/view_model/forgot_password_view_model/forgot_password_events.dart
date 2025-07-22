

import 'package:exam_app/features/auth/domin/entities/forgot_password_req.dart';

abstract class ForgotPasswordEvents {}

class SendForgotPasswordEmailEvent extends ForgotPasswordEvents {
  final ForgotPasswordRequset email;

  SendForgotPasswordEmailEvent(this.email);
}

class ValidateForgotPasswordEvent extends ForgotPasswordEvents {
 
}
class SendEmailAgainEvent extends ForgotPasswordEvents{}


