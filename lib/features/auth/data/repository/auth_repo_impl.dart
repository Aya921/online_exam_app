import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/auth/data/source/auth_api_service.dart';
import 'package:exam_app/features/auth/domin/entities/user_entity.dart';

import 'package:exam_app/features/auth/domin/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _authRemoteDataSource;
  AuthRepoImpl(this._authRemoteDataSource);

  @override
  Future<ApiResult<UserModel>> signUp(UserModel userModel) async {
    return await _authRemoteDataSource.signUp(userModel);
  }
}
