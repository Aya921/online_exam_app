// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:exam_app/features/auth/domin/entities/verfity_code_req.dart';

abstract class VerifyCodeEvents {}

class VerifyEmailCodeEvent extends VerifyCodeEvents {
  VerifyResetCodeRequest verifyResetCodeRequest;
  VerifyEmailCodeEvent({required this.verifyResetCodeRequest});
}

class ResendCodeAgainEvent extends VerifyCodeEvents {
  String email;
  ResendCodeAgainEvent(this.email);
}
