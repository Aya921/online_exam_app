// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/exam/domin/entity/question_model.dart';
import 'package:exam_app/features/exam/domin/usecase/get_questions_usecase.dart';
import 'package:exam_app/features/exam/presentation/view_models/qustion_view_model/quesion_events.dart';
import 'package:exam_app/features/exam/presentation/view_models/qustion_view_model/quesion_state.dart';

@injectable
class QustionViewModel extends Bloc<QuestionEvents, QuestionState> {
  final GetQuestionsUsecase _questionsUsecase;


  QustionViewModel(this._questionsUsecase)
    : super(QuestionState()) {
    on<GetQuestionsEvent>(_getQuestions);
    on<UpdateStudentAnswerEvent>(_updateAnswers);
    on<EndTimeEvent>(_timeEnd);
 
  }

  Future<void> _getQuestions(GetQuestionsEvent event, Emitter emit) async {
    emit(state.copyWith(isLoading: true));
    final res = await _questionsUsecase.getQuestions(event.emailId);

    switch (res) {
      case ApiSucessResult<List<QuestionsModel>>():
        emit(state.copyWith(isLoading: false, questionsList: res.sucessResult));
      case ApiFailedResult<List<QuestionsModel>>():
        emit(state.copyWith(isLoading: false, errorMessage: res.errorMessage));
    }
  }

  Future<void> _updateAnswers(
    UpdateStudentAnswerEvent event,
    Emitter emit,
  ) async {
    final List<List<String?>?> newStudentAnswer = event.answers;
    newStudentAnswer[event.index]![0] = event.value;
    emit(state.copyWith(studentAswers: newStudentAnswer));
  }

 
  void _timeEnd(EndTimeEvent event, Emitter emit) {
    emit(state.copyWith(isTimeEnd: true));
  }

  
}
