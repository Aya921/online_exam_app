import 'package:bloc/bloc.dart';
import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/profile/api/model/change_password_body/change_password_body.dart';
import 'package:exam_app/features/profile/domin/usecases/change_password_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'change_password_state.dart';

@injectable
class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordUsecase changePasswordUsecase;
  ChangePasswordCubit({required this.changePasswordUsecase})
    : super(ChangePasswordInitial());

  void changePassword(ChangePasswordBody body) async {
    emit(ChangePasswordLoding());
    final result = await changePasswordUsecase.call(body);
    switch (result) {
      case final ApiSucessResult _:
        emit(ChangePasswordSuccess());
        break;
      case final ApiFailedResult errorResult:
        emit(ChangePasswordFailed(errorMessage: errorResult.errorMessage));
        break;
    }
  }
}
