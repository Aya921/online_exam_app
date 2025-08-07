
import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/profile/domin/repository/profile_repo.dart';
import 'package:injectable/injectable.dart';


@injectable
class UpdateUserDataUsecase {
  final ProfileRepo _profileRepo;

  UpdateUserDataUsecase(this._profileRepo);

  Future<ApiResult<void>> call(Map<String, dynamic> body) async {
     return await _profileRepo.editProfile(body);
  }
}