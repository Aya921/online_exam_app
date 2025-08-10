import 'package:exam_app/features/exam/domin/entity/question_model.dart';

class QuestionState {
  List<QuestionsModel>? questionsList;
  String? errorMessage;
  bool isLoading;
  List<List<String?>?> studentAswers;
  bool isTimeEnd;
  int? seconds;

  QuestionState({
    this.questionsList,
    this.errorMessage,
    this.isLoading = true,
    this.isTimeEnd = false,
    this.seconds,

    List<List<String?>?>? studentAswers,
  }) : studentAswers = studentAswers ?? [];

  QuestionState copyWith({
    bool? isLoading,
    List<QuestionsModel>? questionsList,
    String? errorMessage,
    List<List<String?>?>? studentAswers,

    bool? isTimeEnd,
    int? seconds,
  }) {
    return QuestionState(
      isLoading: isLoading ?? this.isLoading,
      questionsList: questionsList ?? this.questionsList,
      errorMessage: errorMessage,
      studentAswers: studentAswers ?? this.studentAswers,

      isTimeEnd: isTimeEnd ?? this.isTimeEnd,
      seconds: seconds ?? this.seconds,
    );
  }
}
