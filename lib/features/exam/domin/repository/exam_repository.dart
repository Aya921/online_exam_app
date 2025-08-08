

import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/exam/domin/entity/question_model.dart';
import 'package:exam_app/features/exam/domin/entity/exam_model.dart';
import 'package:exam_app/features/exam/domin/entity/subject_model.dart';
import 'package:exam_app/features/exam/domin/entity/user_entity.dart';

abstract interface class ExamRepository {
  Future<ApiResult<List<SubjectModel>>> getAllSubjects();
  Future<ApiResult<List<ExamModel>>> getExamsOnSubjectById(String subjectId);
  Future<ApiResult<List<QuestionsModel>>> getQuestions(String examId);
    Future<ApiResult<UserEntity>> getProfileData();

}
