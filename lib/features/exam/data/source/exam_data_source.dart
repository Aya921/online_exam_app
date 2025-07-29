import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/exam/domin/entity/exam_model.dart';
import 'package:exam_app/features/exam/domin/entity/subject_model.dart';

abstract class ExamDataSource {
  Future<ApiResult<List<SubjectModel>>> getAllSubjects();
  Future<ApiResult<List<ExamModel>>> getExamONSubjectById(String subjectId);
}
