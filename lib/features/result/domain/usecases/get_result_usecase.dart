import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/result/domain/entities/check_response_model.dart';
import 'package:exam_app/features/result/domain/entities/student_answer.dart';
import 'package:exam_app/features/result/domain/repository/result_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetResultUsecase {
  final ResultRepository _resultRepository;
  GetResultUsecase(this._resultRepository);

  Future<ApiResult<CheckResponseModel>> getResult(StudentAnswer answersToCheck)async {
    return await _resultRepository.getResult(answersToCheck);
  }
}
