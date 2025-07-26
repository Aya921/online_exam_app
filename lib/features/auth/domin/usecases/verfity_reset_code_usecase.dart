// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/auth/domin/entities/verfity_code_req.dart';
import 'package:exam_app/features/auth/domin/repository/auth_repo.dart';
import 'package:injectable/injectable.dart';




@injectable
class VerfityResetCodeUsecase {
  final AuthRepo _authRepo;
  VerfityResetCodeUsecase(this._authRepo);

  Future<ApiResult<void>> verifyResetCode(VerifyResetCodeRequest code) async {
    return await _authRepo.verifyResetCode(code);
  }
}
