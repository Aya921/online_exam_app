import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/confing/local_result/local_result.dart';
import 'package:exam_app/features/result/domain/entities/answers_model.dart';
import 'package:exam_app/features/result/domain/entities/check_response_model.dart';
import 'package:exam_app/features/result/domain/entities/result_model.dart';
import 'package:exam_app/features/result/domain/entities/student_answer.dart';
import 'package:exam_app/features/result/domain/usecases/get_local_result_usecase.dart';
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
  final GetLocalResultUseCase _getLocalResultUseCase;
  ResultViewModel(
    this._getResultUsecase,
    this._saveResultUsecase,
    this._getLocalResultUseCase,
  ) : super(ResultState()) {
    on<GetResultEvent>(_getResult);
    on<SaveResultEvent>(_saveResult);
    on<GetLocalResultEvent>(_getLocalResult);
    on<CheckCorrectAndWrongContainersEvent>(_checkCorrectAndWrongAnswers);
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

  Future<void> _saveResult(SaveResultEvent event, Emitter emit) async {
    final res = await _saveResultUsecase.saveResult(event.resultModel);
    switch (res) {
      case SucessLocalResult<void>():
        emit(state.copyWith(isSaved: true));

      case FailedLocalResult<void>():
        emit(state.copyWith(errorMessage: res.failedResultMessage));
    }
  }

  Future<void> _getLocalResult(GetLocalResultEvent event, Emitter emit) async {
    emit(state.copyWith(isLoading: true));
    final res = await _getLocalResultUseCase.getLocalResult();
    switch (res) {
      case SucessLocalResult<List<ResultModel>>():
        emit(
          state.copyWith(resultModelList: res.sucessResult, isLoading: false),
        );
      case FailedLocalResult<List<ResultModel>>():
        emit(
          state.copyWith(
            errorMessage: res.failedResultMessage,
            isLoading: false,
          ),
        );
    }
  }

  void _checkCorrectAndWrongAnswers(
    CheckCorrectAndWrongContainersEvent event,
    Emitter emit,
  ) {
    final List<int> wrongNumbers = [];
    final List<int> correctNumbers = [];
    for (var qId in event.questionIds) {
      int wrongcontainerNumber = -1;
      int correctcontainerNumber = -1;

      for (var wrong in event.wrongAnswers) {
        if (qId == wrong.qid) {
          correctcontainerNumber = int.parse(wrong.correctAnswer!.substring(1));

          if (wrong.inCorrectAnswer != "AA") {
            wrongcontainerNumber = int.parse(
              wrong.inCorrectAnswer!.substring(1),
            );
          } else {
            // this mean this is empty field
            wrongcontainerNumber = correctcontainerNumber;
          }
          break;
        }
      }
      for (var correct in event.correctAnswers) {
        if (qId == correct.qid) {
          correctcontainerNumber = int.parse(
            correct.correctAnswer!.substring(1),
          );
          break;
        }
      }
      wrongNumbers.add(wrongcontainerNumber);
      correctNumbers.add(correctcontainerNumber);
    }
    emit(
      state.copyWith(
        containerCorrectNumber: correctNumbers,
        containerWrongNumber: wrongNumbers,
      ),
    );
  }
}
