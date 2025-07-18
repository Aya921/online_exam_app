import 'package:dio/dio.dart';
import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/core/services/token_service.dart';
import 'package:exam_app/features/auth/api/client/api_servises.dart';
import 'package:exam_app/features/auth/api/model/signin_req.dart';
import 'package:exam_app/features/auth/api/model/signin_req_params.dart';

import 'package:exam_app/features/auth/data/source/auth_api_service.dart';
import 'package:exam_app/features/auth/domin/entities/user_entity.dart';

import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final ApiServises _apiServises;
  final TokenService _tokenService;

  AuthRemoteDataSourceImp(this._apiServises, this._tokenService);
  @override
  Future<ApiResult<UserEntity>> signIn(SigninReqParams params) async {
    try {
      SignInRequest req = SignInRequest(
        email: params.email,
        password: params.password,
      );
      var res = await _apiServises.signIn(req);
      if (res.token != null) {
        await _tokenService.saveToken(res.token!);
      }
      return ApiSucessResult(UserEntity.fromUserDto(res.user!));
    } on DioException catch (e) {
      return ApiFailedResult.fomDioException(e);
    } catch (e) {
      return ApiFailedResult(e.toString());
    }
  }
}
