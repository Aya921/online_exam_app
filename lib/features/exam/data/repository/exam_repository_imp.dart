import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/exam/data/source/exam_data_source.dart';
import 'package:exam_app/features/exam/domin/entity/exam_model.dart';
import 'package:exam_app/features/exam/domin/entity/subject_model.dart';

import 'package:exam_app/features/exam/domin/repository/exam_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExamRepository)
class ExamRepositoryImp implements ExamRepository {
  final ExamRemoteDataSource  _examDataSource;
  ExamRepositoryImp(this._examDataSource);

  @override
  Future<ApiResult<List<SubjectModel>>> getAllSubjects() async{
    return await _examDataSource.getAllSubjects();
  }

  @override
  Future<ApiResult<List<ExamModel>>> getExamsOnSubjectById(String subjectId) async {
    return await _examDataSource.getExamONSubjectById(subjectId);
  }
}
