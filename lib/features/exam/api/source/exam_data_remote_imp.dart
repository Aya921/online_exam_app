import 'package:dio/dio.dart';
import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/core/constant/endPoints_constants/endpoints.dart';
import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';
import 'package:exam_app/features/exam/api/client/api_service.dart';

import 'package:exam_app/features/exam/data/source/exam_data_source.dart';

import 'package:injectable/injectable.dart';


@Injectable(as: ExamDataSource)
class ExamDataRemoteImp implements ExamDataSource {
  final ApiService _apiService;

  ExamDataRemoteImp(this._apiService);

 
  
}
