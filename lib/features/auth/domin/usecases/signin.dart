import 'package:exam_app/confing/api_result/api_result.dart';

import 'package:exam_app/features/auth/api/model/signin_req_params.dart';

import 'package:exam_app/features/auth/domin/entities/user_entity.dart';
import 'package:exam_app/features/auth/domin/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SigninUsecase {
  final AuthRepo _authRepoImpl;
  SigninUsecase(this._authRepoImpl);
  Future<ApiResult<UserEntity>> call({SigninReqParams? params}) async {
    return await _authRepoImpl.signIn(params!);
  }
}
