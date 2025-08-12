// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:exam_app/features/exam/domin/entity/question_model.dart';
import 'package:exam_app/features/result/domain/entities/check_response_model.dart';

class ResultModel {
  
  int seconds;
  int correct;
  List<QuestionsModel> questions;
  CheckResponseModel answers;

  ResultModel({
    
    required this.seconds,
    required this.correct,
    required this.questions,
    required this.answers,
  });
}
