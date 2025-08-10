import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/auth/domin/entities/reset_password_req.dart';
import 'package:exam_app/features/auth/domin/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUsecase {
  final AuthRepo _authRepo;
  ResetPasswordUsecase(this._authRepo);

  Future<ApiResult<void>> resetPassword(
    ResetPasswordRequest resetPassword,
  ) async {
    return await _authRepo.resetPassword(resetPassword);
  }
}
