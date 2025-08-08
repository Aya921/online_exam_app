// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:exam_app/features/exam/domin/entity/question_model.dart';

abstract class ResultEvent {}

class GetResultEvent extends ResultEvent {
  final List<List<String?>?> studentanswers;
 
  final List<QuestionsModel> questionsModel;
  GetResultEvent({
    required this.studentanswers,
    required this.questionsModel,
  });
  
  
}

class SaveResultEvent extends ResultEvent{
  
}
 