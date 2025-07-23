import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/auth/domin/entities/forgot_password_req.dart';
import 'package:exam_app/features/auth/domin/usecases/forget_password_usecase.dart';
import 'package:exam_app/features/auth/presentation/forget_password_events.dart';
import 'package:exam_app/features/auth/presentation/forget_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvents, ForgetPasswordState> {
  final ForgetPasswordUsecase _forgetPasswordUsecase;

  ForgetPasswordBloc(this._forgetPasswordUsecase)
    : super(ForgetPasswordState()) {
    on<SendResetEmailEvent>(_forgetPassword);
  }

  void _forgetPassword(
    SendResetEmailEvent event,
    Emitter<ForgetPasswordState> emit,
  ) async {
    final res = await _forgetPasswordUsecase.forgetPassword(
      ForgotPasswordRequset(email: event.email),
    );
    switch (res) {
      case ApiSucessResult<void>():
        emit(state.copyWith(isvrifyCodeSent: true , email: event.email));
        break;
      case ApiFailedResult<void>():
      var error = res.errorMessage;
        emit(
          state.copyWith(
            isvrifyCodeSent: false,
            errorEmail: error,
          ),
        );
        break;
    }
  }
}
