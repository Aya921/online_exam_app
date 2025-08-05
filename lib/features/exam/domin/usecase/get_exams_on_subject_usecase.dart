import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/exam/domin/entity/exam_model.dart';
import 'package:exam_app/features/exam/domin/repository/exam_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetExamsOnSubjectUsecase {
  final ExamRepository _examRepository;
  GetExamsOnSubjectUsecase(this._examRepository);
  Future<ApiResult<List<ExamModel>>> invok(String subjectId) async =>
      await _examRepository.getExamsOnSubjectById(subjectId);
}
