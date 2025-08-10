// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:exam_app/features/exam/domin/entity/question_model.dart';
import 'package:exam_app/features/result/domain/entities/correct_question_model.dart';
import 'package:exam_app/features/result/domain/entities/result_model.dart';
import 'package:exam_app/features/result/domain/entities/wrong_question_model.dart';

abstract class ResultEvent {}

class GetResultEvent extends ResultEvent {
  final List<List<String?>?> studentanswers;

  final List<QuestionsModel> questionsModel;
  GetResultEvent({required this.studentanswers, required this.questionsModel});
}

class SaveResultEvent extends ResultEvent {
  ResultModel resultModel;
  SaveResultEvent({required this.resultModel});
}

class GetLocalResultEvent extends ResultEvent {}

class CheckCorrectAndWrongContainersEvent extends ResultEvent {


 final List<String> questionIds;

  List<WrongQuestionModel> wrongAnswers;
  List<CorrectQuestionModel> correctAnswers;
  CheckCorrectAndWrongContainersEvent({
    required this.questionIds,
    required this.wrongAnswers,
    required this.correctAnswers,
  });
}
