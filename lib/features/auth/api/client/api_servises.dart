import 'package:dio/dio.dart';
import 'package:exam_app/core/constant/endPoints_constants/endpoints.dart';
import 'package:exam_app/features/auth/api/model/forget_password/forget_password_request/forget_password_request.dart';
import 'package:exam_app/features/auth/api/model/forget_password/forget_password_respone/forget_password_respone.dart';
import 'package:exam_app/features/auth/api/model/reset_password_request/reset_password_request.dart';
import 'package:exam_app/features/auth/api/model/verify_reset_code_request/verify_reset_code_request.dart';
import 'package:exam_app/features/auth/api/model/signin_request/signin_request_dto.dart';

import 'package:exam_app/features/auth/api/model/signup_response/signup_response.dart';
import 'package:exam_app/features/auth/api/model/signup_request/signup_request_dto.dart';

import 'package:exam_app/features/auth/api/model/signin_response/signin_response.dart';

import 'package:injectable/injectable.dart';

import 'package:retrofit/retrofit.dart';

part 'api_servises.g.dart';

@RestApi(baseUrl: Endpoints.apiUrl+Endpoints.auth)
@injectable
abstract class ApiServises {
  @factoryMethod
  factory ApiServises(Dio dio) = _ApiServises;

  @POST(Endpoints.signinEndPoint)
  Future<SigninRespones> signIn(@Body() SigninRequestDto body);

  @POST(Endpoints.signupEndPoint)
  Future<SignupResponse> signUp(@Body() SignUpRequestDto usermoodel);

  @POST(Endpoints.forgotPasswordEndPoint)
  Future<void> forgetPassword(@Body() ForgetPasswordRequestDto email);

  @POST(Endpoints.verifyResetCodeEndPoint)
  Future<void> verifyResetCode(@Body() VerifyResetCodeRequestDto code);
  @PUT(Endpoints.resetPasswordEndPoint)
  Future<ForgetPasswordRespone> resetPassword(@Body() ResetPasswordDto resetPassword);
}
