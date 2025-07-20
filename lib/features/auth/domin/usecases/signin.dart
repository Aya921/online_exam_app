import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/auth/domin/entities/signin_req.dart';

import 'package:exam_app/features/auth/domin/entities/user_entity.dart';
import 'package:exam_app/features/auth/domin/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SigninUsecase {
  final AuthRepo _authRepoImpl;
  SigninUsecase(this._authRepoImpl);
  Future<ApiResult<UserModel>> call(SignInRequest params) async {
    return await _authRepoImpl.signIn(params);
  }
}
