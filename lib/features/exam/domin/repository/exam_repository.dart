import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/exam/domin/entity/question_model.dart';


abstract class ExamRepository {
  Future<ApiResult<List<QuestionsModel>>> getQuestions(String examId);
}
