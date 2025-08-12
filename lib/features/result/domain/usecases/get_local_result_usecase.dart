import 'package:exam_app/confing/local_result/local_result.dart';
import 'package:exam_app/features/result/domain/entities/result_model.dart';
import 'package:exam_app/features/result/domain/repository/result_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLocalResultUseCase {
  final ResultRepository _resultRepository;
  GetLocalResultUseCase(this._resultRepository);

  Future<LocalResult<List<ResultModel>>> getLocalResult(
   
  ) async {
    return await _resultRepository.getLocalResult();
  }
}
