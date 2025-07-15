import 'package:dio/dio.dart';
import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/core/constant/endPoints_constants/endpoints.dart';
import 'package:exam_app/features/auth/api/client/api_servises.dart';

import 'package:exam_app/features/auth/data/source/auth_api_service.dart';
import 'package:exam_app/features/auth/domin/entities/user_entity.dart';

import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  final ApiServises _apiServises;

  AuthRemoteDataSourceImp(this._apiServises);
 
}
