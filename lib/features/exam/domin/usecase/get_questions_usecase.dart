import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/exam/domin/entity/question_model.dart';

import 'package:exam_app/features/exam/domin/repository/exam_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetQuestionsUsecase {
  final ExamRepository _examRepository;
  GetQuestionsUsecase(this._examRepository);

  Future<ApiResult<List<QuestionsModel>>> getQuestions(String examId) async {
    return await _examRepository.getQuestions(examId);
  }
}
