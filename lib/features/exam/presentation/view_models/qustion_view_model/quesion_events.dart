// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:exam_app/features/exam/domin/entity/question_model.dart';

abstract class QuestionEvents {}

class GetQuestionsEvent extends QuestionEvents {
  final String emailId;
  GetQuestionsEvent({required this.emailId});
}

class UpdateStudentAnswerEvent extends QuestionEvents {
  final List<List<String?>?> answers;
  final String value;
  final int index;
  UpdateStudentAnswerEvent({
    required this.answers,
    required this.value,
    required this.index,
  });
}

class ClalculateScroeEvent extends QuestionEvents {
  final List<List<String?>?> studentanswers;
 
  final List<QuestionsModel> questionsModel;
  
  ClalculateScroeEvent({
    required this.studentanswers,
   
    required this.questionsModel,
  });
}

class EndTimeEvent extends QuestionEvents {}
