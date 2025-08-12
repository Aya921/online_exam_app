import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/result/domain/entities/check_response_model.dart';
import 'package:exam_app/features/result/domain/entities/student_answer.dart';

abstract class ResultRemoteDataSource {
  Future<ApiResult<CheckResponseModel>> getResult(StudentAnswer answersToCheck);
 
}
