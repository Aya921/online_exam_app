
import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/profile/domin/entities/user_entity.dart';
import 'package:exam_app/features/profile/domin/repository/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllUserDataUsecase {
  final ProfileRepo _profileRepo;

  GetAllUserDataUsecase(this._profileRepo);

  Future<ApiResult<UserEntity>> call()async {
    return await _profileRepo.getProfileData();
  }

}