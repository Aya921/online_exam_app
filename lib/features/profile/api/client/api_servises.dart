import 'package:dio/dio.dart';
import 'package:exam_app/core/constant/endPoints_constants/endpoints.dart';
import 'package:exam_app/features/profile/api/model/change_password_body/change_password_body.dart';
import 'package:exam_app/features/exam/api/model/profile_data_respone/profile_data_respone.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_servises.g.dart';

@RestApi(baseUrl: Endpoints.apiUrl + Endpoints.auth)
@injectable
abstract class ProfileApiServises {
  @factoryMethod
  factory ProfileApiServises(Dio dio) = _ProfileApiServises;


  @PUT(Endpoints.editProfile)
  Future<void> editProfile(
    @Body() Map<String, dynamic> profileData,
  );

  @PATCH(Endpoints.changePassword)
  Future<void> changePassword(@Body() ChangePasswordBody passwordData);
}
