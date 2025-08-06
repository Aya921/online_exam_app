import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/auth/domin/entities/forgot_password_req.dart';
import 'package:exam_app/features/auth/domin/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUsecase {
  final AuthRepo _authRepo;
  ForgetPasswordUsecase(this._authRepo);

  Future<ApiResult<void>> forgetPassword(ForgotPasswordRequset email) async {
    return await _authRepo.forgetPassword(email);
  }

  
}
