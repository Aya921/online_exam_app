

import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/profile/api/model/change_password_body/change_password_body.dart';
import 'package:exam_app/features/profile/domin/repository/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordUsecase {
  final ProfileRepo _profileRepo;

  ChangePasswordUsecase(this._profileRepo);

  Future<ApiResult<void>> call(ChangePasswordBody body)   async {
    return await _profileRepo.changePassword(body);
  }
}
