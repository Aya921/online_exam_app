
import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/profile/api/model/change_password_body/change_password_body.dart';

abstract class ProfileRepo {
  Future<ApiResult<void>> editProfile(Map<String, dynamic> body);
  Future<ApiResult<void>> changePassword(ChangePasswordBody body);
}

