import 'package:exam_app/confing/local_result/local_result.dart';
import 'package:exam_app/features/result/domain/entities/result_model.dart';

abstract class ResultLocalDataSource {
  Future<LocalResult<void>> saveData(ResultModel resultModel);
  Future<LocalResult<List<ResultModel>>> getLocalResult();
}
