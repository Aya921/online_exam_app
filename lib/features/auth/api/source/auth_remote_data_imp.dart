import 'package:dio/dio.dart';
import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/core/constant/endPoints_constants/endpoints.dart';

import 'package:exam_app/core/services/token_service.dart';
import 'package:exam_app/features/auth/api/client/api_servises.dart';
import 'package:exam_app/features/auth/api/model/signup_response/signup_response.dart';
import 'package:exam_app/features/auth/api/model/user_send_dto.dart';
import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';

import 'package:exam_app/features/auth/data/source/auth_api_service.dart';
import 'package:exam_app/features/auth/domin/entities/user_entity.dart';

import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final ApiServises _apiServises;
  final TokenService _tokenStorage;

  AuthRemoteDataSourceImp(this._apiServises, this._tokenStorage);

  @override
  Future<ApiResult<UserModel>> signUp(UserModel userModel) async {
    SignupResponse signupResponse;
    try {
      signupResponse = await _apiServises.signUp(UserSendDto.toDto(userModel));
      _tokenStorage.saveToken(signupResponse.token!);

      final user = signupResponse.user!.toUserModel(signupResponse.token!);
      return ApiSucessResult(user);
    } on DioException catch (e) {
      final data = e.response?.data;
      String errorMessage = e.toString();

      if (data is Map<String, dynamic> &&
          data.containsKey(Endpoints.messageResponseKey)) {
        errorMessage = data[JsonConstants.message].toString();
      }

      return ApiFailedResult(errorMessage);
    } catch (e) {
      return ApiFailedResult(e.toString());
    }
  }
}
