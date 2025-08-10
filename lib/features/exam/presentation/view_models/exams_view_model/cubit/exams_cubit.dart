import 'package:bloc/bloc.dart';
import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/exam/domin/entity/exam_model.dart';
import 'package:exam_app/features/exam/domin/usecase/get_exams_on_subject_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'exams_state.dart';

@injectable
class ExamsCubit extends Cubit<ExamsState> {
  final GetExamsOnSubjectUsecase _examsOnSubjectUsecase;
  ExamsCubit(this._examsOnSubjectUsecase) : super(ExamsInitial());

  Future<void> getExamsOnSubject(String subjectId) async {
    emit(ExamsLoading());
    final result = await _examsOnSubjectUsecase.invok(subjectId);
    switch (result) {
      case final ApiSucessResult<List<ExamModel>> successResult:
        emit(ExamsSuccess(exams: successResult.sucessResult));
        break;
      case final ApiFailedResult errorResult:
        emit(ExamsFailed(errorMessage: errorResult.errorMessage));
        break;
    }
  }
}
