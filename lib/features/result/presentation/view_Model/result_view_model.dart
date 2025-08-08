import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/result/domain/entities/answers_model.dart';
import 'package:exam_app/features/result/domain/entities/check_response_model.dart';
import 'package:exam_app/features/result/domain/entities/student_answer.dart';
import 'package:exam_app/features/result/domain/usecases/get_result_usecase.dart';
import 'package:exam_app/features/result/domain/usecases/save_result_usecase.dart';
import 'package:exam_app/features/result/presentation/view_Model/result_event.dart';
import 'package:exam_app/features/result/presentation/view_Model/result_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResultViewModel extends Bloc<ResultEvent, ResultState> {
  final GetResultUsecase _getResultUsecase;
  final SaveResultUsecase _saveResultUsecase;
  ResultViewModel(this._getResultUsecase, this._saveResultUsecase) : super(ResultState()) {
    on<GetResultEvent>(_getResult);
  }

  Future<void> _getResult(GetResultEvent event, Emitter emit) async {
    emit(state.copyWith(isLoading: true));
    final List<String?> questionsIdList = event.questionsModel
        .map((question) => question.id)
        .toList();
    final List<String?> studentAnswer = event.studentanswers
        .map((stuAnswer) => stuAnswer![0])
        .toList();

    studentAnswer.remove(studentAnswer[0]);
    final List<AnswersModel> answers = [];
    for (int i = 0; i < questionsIdList.length; i++) {
      final AnswersModel answersModel = AnswersModel();

      answersModel.questionId = questionsIdList[i];
      answersModel.correct = studentAnswer[i];

      answers.add(answersModel);
    }
    final checkReq = StudentAnswer(
      answers: answers,
      time: event.questionsModel[0].exam!.duration,
    );
    final res = await _getResultUsecase.getResult(checkReq);
    switch (res) {
      case ApiSucessResult<CheckResponseModel>():
        emit(
          state.copyWith(
            checkResponseModel: res.sucessResult,
            isLoading: false,
          ),
        );

      case ApiFailedResult<CheckResponseModel>():
        emit(state.copyWith(errorMessage: res.errorMessage, isLoading: false));
    }
  }

  // Future<void> _saveResult(){

  // }

}
