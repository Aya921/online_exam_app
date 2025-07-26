import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/auth/domin/entities/signup_req.dart';
import 'package:exam_app/features/auth/domin/entities/user_entity.dart';
import 'package:exam_app/features/auth/domin/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupUseCase {
  final AuthRepo _authRepo;
  SignupUseCase(this._authRepo);

  Future<ApiResult<UserModel>> signUp(SignupRequest userData) async {
    return await _authRepo.signUp(userData);
  }
}
