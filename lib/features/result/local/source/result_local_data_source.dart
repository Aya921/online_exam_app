// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:exam_app/confing/local_result/local_result.dart';
import 'package:exam_app/features/result/data/sources/result_local_data_source.dart';
import 'package:exam_app/features/result/domain/entities/result_model.dart';
import 'package:exam_app/features/result/local/models/result_model_dto.dart';

@Injectable(as: ResultLocalDataSource)
class ResultLocalDataSourceImp implements ResultLocalDataSource {
  final Isar _isar;
  ResultLocalDataSourceImp(this._isar);
  @override
  Future<LocalResult<void>> saveData(ResultModel resultModel) async {
    try {
      await _isar.writeTxn(() async {
        await _isar.resultModelDtos.put(ResultModelDto.toDto(resultModel));
        
      });
      return SucessLocalResult(sucessResult: null);
    } catch (e) {
      return FailedLocalResult(failedResultMessage: e.toString());
    }
  }

  @override
  Future<LocalResult<List<ResultModel>>> getLocalResult(
 
  ) async {
    try {
      final resDto = _isar.resultModelDtos.where().findAllSync();
      final resModel = resDto.map((dto) => dto.toModel()).toList();
      return SucessLocalResult(sucessResult: resModel);
    } catch (e) {
      return FailedLocalResult(failedResultMessage: e.toString());
    }
  }
}
