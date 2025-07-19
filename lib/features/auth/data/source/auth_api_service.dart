import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/auth/domin/entities/user_entity.dart';

import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/auth/api/model/signin_req_params.dart';
import 'package:exam_app/features/auth/domin/entities/user_entity.dart';

abstract class AuthRemoteDataSource {
  Future<ApiResult<UserModel>> signUp(UserModel userModel);
  Future<ApiResult<UserEntity>> signIn(SigninReqParams params);

}
