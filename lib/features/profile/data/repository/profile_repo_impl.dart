import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/profile/api/model/change_password_body/change_password_body.dart';
import 'package:exam_app/features/profile/data/sources/profile_api_servises.dart';
import 'package:exam_app/features/profile/domin/repository/profile_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource _profileRemoteDataSource;

  ProfileRepoImpl(this._profileRemoteDataSource);
  @override
  Future<ApiResult<void>> changePassword(ChangePasswordBody body) async {
    return await _profileRemoteDataSource.changePassword(body);
  }

  @override
  Future<ApiResult<void>> editProfile(Map<String, dynamic> body) async {
    return await _profileRemoteDataSource.editProfile(body);
  }


}
