import 'package:exam_app/confing/api_result/api_result.dart';


import 'package:exam_app/features/auth/domin/entities/forgot_password_req.dart';
import 'package:exam_app/features/auth/domin/entities/reset_password_req.dart';
import 'package:exam_app/features/auth/domin/entities/signin_req.dart';
import 'package:exam_app/features/auth/domin/entities/signup_req.dart';
import 'package:exam_app/features/auth/domin/entities/user_entity.dart';
import 'package:exam_app/features/auth/domin/entities/verfity_code_req.dart';

abstract class AuthRepo {
  Future<ApiResult<UserModel>> signUp(SignupRequest userModel);

  Future<ApiResult<UserModel>> signIn(SignInRequest params);
  Future<ApiResult<void>> forgetPassword(ForgotPasswordRequset email);
  Future<ApiResult<void>> verifyResetCode(VerifyResetCodeRequest code);
  Future<ApiResult<void>> resetPassword(ResetPasswordRequest resetPassword);
}
