import 'package:dio/dio.dart';
import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/exam/api/client/api_service.dart';

import 'package:exam_app/features/exam/data/source/exam_data_source.dart';
import 'package:exam_app/features/exam/domin/entity/exam_model.dart';
import 'package:exam_app/features/exam/domin/entity/subject_model.dart';

import 'package:injectable/injectable.dart';

@Injectable(as: ExamDataSource)
class ExamDataRemoteImp implements ExamDataSource {
  final ExamApiService _ExamApiService;

  ExamDataRemoteImp(this._ExamApiService);

  @override
  Future<ApiResult<List<SubjectModel>>> getAllSubjects() async {
    try {
      final response = await _ExamApiService.getAllSubjects();
      final List<SubjectModel> subjects =
          response.subjects
              ?.map((suject) => suject.toSubjectModel())
              .toList() ??
          [];

      return ApiSucessResult(subjects);
    } on DioException catch (e) {
      return ApiFailedResult.fomDioException(e);
    } catch (e) {
      return ApiFailedResult(e.toString());
    }
  }

  @override
  Future<ApiResult<List<ExamModel>>> getExamONSubjectById(String subjectId) async {
    try {
      final response = await _ExamApiService.getAllExamsOnSubjects(subjectId);
      final List<ExamModel> exams =
          response.exams?.map((exam) => exam.toExamModel()).toList() ?? [];

      return ApiSucessResult(exams);
    } on DioException catch (e) {
      return ApiFailedResult.fomDioException(e);
    } catch (e) {
      return ApiFailedResult(e.toString());
    }
    
  }
}
