import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/confing/local_result/local_result.dart';
import 'package:exam_app/features/result/data/sources/result_local_data_source.dart';

import 'package:exam_app/features/result/domain/entities/check_response_model.dart';
import 'package:exam_app/features/result/domain/entities/result_model.dart';

import 'package:exam_app/features/result/domain/entities/student_answer.dart';

import 'package:exam_app/features/result/data/sources/result_remote_data_source.dart';
import 'package:exam_app/features/result/domain/repository/result_repository.dart';

import 'package:injectable/injectable.dart';

@Injectable(as: ResultRepository)
class ResultRespositoryImp implements ResultRepository {
  final ResultRemoteDataSource _resultRemoteDataSource;
  final ResultLocalDataSource _resultLocalDataSource;
  ResultRespositoryImp(
    this._resultRemoteDataSource,
    this._resultLocalDataSource,
  );

  @override
  Future<ApiResult<CheckResponseModel>> getResult(
    StudentAnswer answersToCheck,
  ) async {
    return await _resultRemoteDataSource.getResult(answersToCheck);
  }

  @override
  Future<LocalResult<void>> saveResult(ResultModel resultModel) async {
    return await _resultLocalDataSource.saveData(resultModel);
  }

  @override
  Future<LocalResult<List<ResultModel>>> getLocalResult(
    
  ) async {
    return await _resultLocalDataSource.getLocalResult();
  }
}
