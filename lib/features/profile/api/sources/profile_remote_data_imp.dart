import 'package:dio/dio.dart';
import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/core/services/token_service.dart';
import 'package:exam_app/features/profile/api/client/api_servises.dart';
import 'package:exam_app/features/profile/api/model/change_password_body/change_password_body.dart';
import 'package:exam_app/features/profile/data/sources/profile_api_servises.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProfileRemoteDataSource)
class ProfileRemoteDataImp implements ProfileRemoteDataSource {
  final ProfileApiServises _profileApiServises;
  final TokenService tokenService;
  ProfileRemoteDataImp(this._profileApiServises , this.tokenService);
  @override
  Future<ApiResult<void>> changePassword(ChangePasswordBody body) async {
    try {
     var response =  await _profileApiServises.changePassword(body);
      tokenService.saveToken(response.token!);

      return ApiSucessResult(null);
    } on DioException catch (e) {
      return ApiFailedResult.fomDioException(e);
    } catch (e) {
      return ApiFailedResult(e.toString());
    }
  }

  @override
  Future<ApiResult<void>> editProfile(Map<String, dynamic> body) async {
    try {
      await _profileApiServises.editProfile(body);
      return ApiSucessResult(null);
    } on DioException catch (e) {
      return ApiFailedResult.fomDioException(e);
    } catch (e) {
      return ApiFailedResult(e.toString());
    }
  }


}
