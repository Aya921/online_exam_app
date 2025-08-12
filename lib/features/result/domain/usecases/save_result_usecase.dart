import 'package:exam_app/confing/local_result/local_result.dart';
import 'package:exam_app/features/result/domain/entities/result_model.dart';
import 'package:exam_app/features/result/domain/repository/result_repository.dart';
import 'package:injectable/injectable.dart';
@injectable
class SaveResultUsecase {
  final ResultRepository _resultRepository;
  SaveResultUsecase(this._resultRepository);

   Future<LocalResult<void>> saveResult(ResultModel resultModel) async {
    return await _resultRepository.saveResult(resultModel);
  }
}
