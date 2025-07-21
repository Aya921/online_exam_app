import 'package:dio/dio.dart';
import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/core/services/token_service.dart';
import 'package:exam_app/core/constant/endPoints_constants/endpoints.dart';

import 'package:exam_app/features/auth/api/client/api_servises.dart';
import 'package:exam_app/features/auth/api/model/forget_password/forget_password_request/forget_password_request.dart';
import 'package:exam_app/features/auth/api/model/reset_password_request/reset_password_request.dart';
import 'package:exam_app/features/auth/api/model/verify_reset_code_request/verify_reset_code_request.dart';
import 'package:exam_app/features/auth/api/model/signin_request/signin_request_dto.dart';
import 'package:exam_app/features/auth/domin/entities/forgot_password_req.dart';
import 'package:exam_app/features/auth/domin/entities/signin_req.dart';

import 'package:exam_app/features/auth/api/model/signup_response/signup_response.dart';
import 'package:exam_app/features/auth/api/model/signup_request/signup_request_dto.dart';
import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';

import 'package:exam_app/features/auth/data/source/auth_api_service.dart';
import 'package:exam_app/features/auth/domin/entities/signup_req.dart';
import 'package:exam_app/features/auth/domin/entities/user_entity.dart';
import 'package:exam_app/features/auth/domin/entities/verfity_code_req.dart';

import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final ApiServises _apiServises;
  final TokenService _tokenService;

  AuthRemoteDataSourceImp(this._apiServises, this._tokenService);
  @override
  Future<ApiResult<UserModel>> signIn(SignInRequest params) async {
    try {
      final signinResponse = await _apiServises.signIn(
        SigninRequestDto.toDto(params),
      );
      if (signinResponse.token != null) {
        await _tokenService.saveToken(signinResponse.token!);
      }
      return ApiSucessResult(signinResponse.user!.toUserModel());
    } on DioException catch (e) {
      return ApiFailedResult.fomDioException(e);
    } catch (e) {
      return ApiFailedResult(e.toString());
    }
  }

  @override
  Future<ApiResult<UserModel>> signUp(SignupRequest userModel) async {
    SignupResponse signupResponse;
    try {
      signupResponse = await _apiServises.signUp(
        SignUpRequestDto.toDto(userModel),
      );
      _tokenService.saveToken(signupResponse.token!);

      final user = signupResponse.user!.toUserModel();
      return ApiSucessResult(user);
    } on DioException catch (e) {
      final data = e.response?.data;
      String errorMessage = e.toString();

      if (data is Map<String, dynamic> &&
          data.containsKey(Endpoints.messageResponseKey)) {
        errorMessage = data[JsonConstants.message].toString();
      }

      return ApiFailedResult(errorMessage);
    } catch (e) {
      return ApiFailedResult(e.toString());
    }
  }

  @override
  Future<ApiResult<void>> forgetPassword(ForgotPasswordRequset email) async {
    try {
      await _apiServises.forgetPassword(ForgetPasswordRequestDto.toDto(email));
      return ApiSucessResult(null);
    } 
    
    on DioException catch (e) {
      final data = e.response?.data;
      String errorMessage = e.toString();

      if (data is Map<String, dynamic> &&
          data.containsKey(Endpoints.messageResponseKey)) {
        errorMessage = data[JsonConstants.message].toString();
      }

      return ApiFailedResult(errorMessage);
    } catch (e) {
      return ApiFailedResult(e.toString());
    }
  }

  @override
  Future<ApiResult<void>> resetPassword(ResetPassword resetPassword) async {
    try {
      await _apiServises.resetPassword(resetPassword);
      return ApiSucessResult(null);
    } on DioException catch (e) {
      return ApiFailedResult.fomDioException(e);
    } catch (e) {
      return ApiFailedResult(e.toString());
    }
  }

  @override
  Future<ApiResult<void>> verifyResetCode(VerifyResetCodeRequest code) async {
    try {
      await _apiServises.verifyResetCode(
        VerifyResetCodeRequestDto.toDto(code)
      );
      return ApiSucessResult(null);
    }   on DioException catch (e) {
      final data = e.response?.data;
      String errorMessage = e.toString();

      if (data is Map<String, dynamic> &&
          data.containsKey(Endpoints.messageResponseKey)) {
        errorMessage = data[JsonConstants.message].toString();
      }

      return ApiFailedResult(errorMessage);
    } catch (e) {
      return ApiFailedResult(e.toString());
    }
  }
}
