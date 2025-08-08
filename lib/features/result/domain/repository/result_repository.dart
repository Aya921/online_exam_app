import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/confing/local_result/local_result.dart';
import 'package:exam_app/features/result/domain/entities/check_response_model.dart';
import 'package:exam_app/features/result/domain/entities/result_model.dart';
import 'package:exam_app/features/result/domain/entities/student_answer.dart';

abstract class ResultRepository {
  Future<ApiResult<CheckResponseModel>> getResult(StudentAnswer answersToCheck);
 Future<LocalResult<void>> saveResult(ResultModel resultModel);
}
