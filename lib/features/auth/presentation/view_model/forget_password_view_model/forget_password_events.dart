abstract class ForgetPasswordEvents {}

class SendResetEmailEvent extends ForgetPasswordEvents {
  final String email;
  SendResetEmailEvent(this.email);
}

class VerifyCodeEvent extends ForgetPasswordEvents {
  final String code;
  VerifyCodeEvent(this.code);
}

class ResetPasswordEvent extends ForgetPasswordEvents {
  final String newPassword;
  ResetPasswordEvent(this.newPassword);
}
