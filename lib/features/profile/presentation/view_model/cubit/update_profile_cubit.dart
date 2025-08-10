import 'package:bloc/bloc.dart';
import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/profile/domin/usecases/update_user_data_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'update_profile_state.dart';

@injectable
class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateUserDataUsecase _updateUserDataUsecase;
  UpdateProfileCubit(this._updateUserDataUsecase)
    : super(UpdateProfileInitial());

  Future<void> updateUserData(Map<String, dynamic> body) async {
    emit(UpdateProfileLoadingState());
    final result = await _updateUserDataUsecase.call(body);
    switch (result) {
      case final ApiSucessResult _:
        emit(UpdateProfileSuccessState());
        break;
      case final ApiFailedResult errorResult:
        emit(UpdateProfileFailedState(errorMessage: errorResult.errorMessage));
        break;
    }
  }
}
