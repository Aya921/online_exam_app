import 'package:exam_app/confing/api_result/api_result.dart';
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
}
