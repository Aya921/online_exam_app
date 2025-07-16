import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/auth/domin/entities/user_entity.dart';

abstract class AuthRepo {
  Future<ApiResult<UserModel>> signUp(UserModel userModel);
}
