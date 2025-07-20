import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/auth/domin/entities/signin_req.dart';
import 'package:exam_app/features/auth/domin/entities/signup_req.dart';
import 'package:exam_app/features/auth/domin/entities/user_entity.dart';



abstract class AuthRemoteDataSource {
  Future<ApiResult<UserModel>> signUp(SignupRequest userModel);
  Future<ApiResult<UserModel>> signIn(SignInRequest params);

}
