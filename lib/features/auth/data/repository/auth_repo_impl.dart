import 'package:exam_app/confing/api_result/api_result.dart';

import 'package:exam_app/features/auth/api/model/forget_password/reset_password_request/reset_password_request.dart';
import 'package:exam_app/features/auth/domin/entities/forgot_password_req.dart';
import 'package:exam_app/features/auth/domin/entities/signin_req.dart';

import 'package:exam_app/features/auth/data/source/auth_api_service.dart';
import 'package:exam_app/features/auth/domin/entities/signup_req.dart';
import 'package:exam_app/features/auth/domin/entities/user_entity.dart';

import 'package:exam_app/features/auth/domin/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;
  AuthRepoImpl(this._authRemoteDataSource);

  @override
  Future<ApiResult<UserModel>> signIn(SignInRequest params) async {
    return await _authRemoteDataSource.signIn(params);
  }

  @override
  Future<ApiResult<UserModel>> signUp(SignupRequest userModel) async {
    return await _authRemoteDataSource.signUp(userModel);
  }

  @override
  Future<ApiResult<void>> forgetPassword(ForgotPasswordRequset email) async {
    return await _authRemoteDataSource.forgetPassword(email);
  }

  @override
  Future<ApiResult<void>> resetPassword(ResetPassword resetPassword) async {
    return await _authRemoteDataSource.resetPassword(resetPassword);
  }

  @override
  Future<ApiResult<void>> verifyResetCode(String email) async {
    return await _authRemoteDataSource.verifyResetCode(email);
  }
}
