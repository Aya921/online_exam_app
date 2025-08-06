import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/exam/domin/entity/subject_model.dart';
import 'package:exam_app/features/exam/domin/repository/exam_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllSubjectsUsecase {
  final ExamRepository _examRepository;
  GetAllSubjectsUsecase(this._examRepository);
  Future<ApiResult<List<SubjectModel>>> invok() async =>
     await  _examRepository.getAllSubjects();
}
