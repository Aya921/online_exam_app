import 'package:exam_app/confing/api_result/api_result.dart';

import 'package:exam_app/features/auth/api/model/reset_password_request/reset_password_request.dart';
import 'package:exam_app/features/auth/domin/entities/forgot_password_req.dart';
import 'package:exam_app/features/auth/domin/entities/signin_req.dart';
import 'package:exam_app/features/auth/domin/entities/signup_req.dart';
import 'package:exam_app/features/auth/domin/entities/user_entity.dart';
import 'package:exam_app/features/auth/domin/entities/verfity_code_req.dart';

abstract class AuthRemoteDataSource {
  Future<ApiResult<UserModel>> signUp(SignupRequest userModel);
  Future<ApiResult<UserModel>> signIn(SignInRequest params);
  Future<ApiResult<void>> forgetPassword(ForgotPasswordRequset email);
  Future<ApiResult<void>> verifyResetCode(VerifyResetCodeRequest email);
  Future<ApiResult<void>> resetPassword(ResetPassword resetPassword);
}
