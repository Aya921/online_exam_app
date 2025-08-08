import 'package:dio/dio.dart';
import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/core/constant/endPoints_constants/endpoints.dart';
import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';

import 'package:exam_app/features/result/api/client/api_service.dart';
import 'package:exam_app/features/result/api/models/check_request/student_answers_dto.dart';

import 'package:exam_app/features/result/domain/entities/check_response_model.dart';

import 'package:exam_app/features/result/domain/entities/student_answer.dart';
import 'package:exam_app/features/result/data/sources/result_remote_data_source.dart';

import 'package:injectable/injectable.dart';

@Injectable(as: ResultRemoteDataSource)
class ResultRemoteDataSourceImp implements ResultRemoteDataSource {
  final ResultApiService _apiService;

  ResultRemoteDataSourceImp(this._apiService);

  @override
  Future<ApiResult<CheckResponseModel>> getResult(
    StudentAnswer answersToCheck,
  ) async {
    try {
      final studentResultDto = await _apiService.getResult(
        StudentAnswerDto.toDto(answersToCheck),
      );

      final studentResultModel = studentResultDto.toModel();

      return ApiSucessResult(studentResultModel);
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
