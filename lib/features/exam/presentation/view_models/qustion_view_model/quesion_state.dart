import 'package:exam_app/features/exam/domin/entity/question_model.dart';

class QuestionState {
  List<QuestionsModel>? questionsList;
  String? errorMessage;
  bool isLoading;
  List<List<String?>?> studentAswers;

  int? wrong;
  int? correct;
  bool isTimeEnd;
  int nQuestion;

  QuestionState({
    this.questionsList,
    this.errorMessage,
    this.isLoading = true,
    this.correct,
    this.wrong,
    this.isTimeEnd = false,
    this.nQuestion=0,

    List<List<String?>?>? studentAswers,
  }) : studentAswers = studentAswers ?? [];

  QuestionState copyWith({
    bool? isLoading,
    List<QuestionsModel>? questionsList,
    String? errorMessage,
    List<List<String?>?>? studentAswers,
    int? wrong,
    int? correct,
    bool? isTimeEnd,
    int? nQuestion
  }) {
    return QuestionState(
      isLoading: isLoading ?? this.isLoading,
      questionsList: questionsList ?? this.questionsList,
      errorMessage: errorMessage,
      studentAswers: studentAswers ?? this.studentAswers,
      correct: correct,
      wrong: wrong,
      isTimeEnd: isTimeEnd ?? this.isTimeEnd,
      nQuestion: nQuestion??this.nQuestion
    );
  }
}
