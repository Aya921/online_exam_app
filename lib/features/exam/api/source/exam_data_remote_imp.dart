import 'package:dio/dio.dart';
import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/core/constant/endPoints_constants/endpoints.dart';
import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';
import 'package:exam_app/features/exam/api/client/api_service.dart';

import 'package:exam_app/features/exam/data/source/exam_data_source.dart';
import 'package:exam_app/features/exam/domin/entity/question_model.dart';

import 'package:injectable/injectable.dart';

@Injectable(as: ExamRemoteDataSource)
class ExamRemoteDataSourceImp implements ExamRemoteDataSource {
  final ExamApiService _apiService;

  ExamRemoteDataSourceImp(this._apiService);

  @override
  Future<ApiResult<List<QuestionsModel>>> getQuestions(String examId) async {
    try {
      final questionsResponseList = await _apiService.getQuestions(
        exam: examId,
      );

      final questionModelList =
          questionsResponseList.questions
              ?.map((question) => question.toModel())
              .toList() ??
          [];

      return ApiSucessResult(questionModelList);
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
