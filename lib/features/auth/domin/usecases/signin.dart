import 'package:exam_app/confing/api_result/api_result.dart';

import 'package:exam_app/features/auth/api/model/signin_req_params.dart';
import 'package:exam_app/features/auth/data/repository/auth_repo_impl.dart';
import 'package:exam_app/features/auth/domin/entities/user_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class SigninUsecase {
  AuthRepoImpl _authRepoImpl;
  SigninUsecase(this._authRepoImpl);
  Future<ApiResult<UserEntity>> call({SigninReqParams? params}) async {
    return await _authRepoImpl.signIn(params!);
  }
}
