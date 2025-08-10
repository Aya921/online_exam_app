import 'package:bloc/bloc.dart';
import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/exam/domin/entity/subject_model.dart';
import 'package:exam_app/features/exam/domin/usecase/get_all_subjects_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'explore_state.dart';

@injectable
class ExploreCubit extends Cubit<ExploreState> {
  GetAllSubjectsUsecase getAllSubjectsUsecase;

  ExploreCubit({required this.getAllSubjectsUsecase}) : super(ExploreInitial());

  Future<void> fetchAllSubjects() async {
    final result = await getAllSubjectsUsecase.invok();
    switch (result) {
      case final ApiSucessResult<List<SubjectModel>> sucessResult:
        emit(ExploreSuccess(subjects: sucessResult.sucessResult));
        break;
      case final ApiFailedResult errorResult:
        emit(ExploreFailed(errorMessage: errorResult.errorMessage));
        break;
    }
  }
}
