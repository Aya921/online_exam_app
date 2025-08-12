import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/auth/domin/entities/forgot_password_req.dart';
import 'package:exam_app/features/auth/domin/entities/reset_password_req.dart';
import 'package:exam_app/features/auth/domin/entities/verfity_code_req.dart';
import 'package:exam_app/features/auth/domin/usecases/forget_password_usecase.dart';
import 'package:exam_app/features/auth/domin/usecases/reset_password_usecase.dart';
import 'package:exam_app/features/auth/domin/usecases/verfity_reset_code_usecase.dart';
import 'package:exam_app/features/auth/presentation/view_model/forget_password_view_model/forget_password_events.dart';
import 'package:exam_app/features/auth/presentation/view_model/forget_password_view_model/forget_password_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvents, ForgetPasswordState> {
  final ForgetPasswordUsecase _forgetPasswordUsecase;
  final ResetPasswordUsecase _resetPasswordUsecase;
  final VerfityResetCodeUsecase _verfityResetCodeUsecase;

  ForgetPasswordBloc(
    this._forgetPasswordUsecase,
    this._resetPasswordUsecase,
    this._verfityResetCodeUsecase,
  ) : super(ForgetPasswordState()) {
    on<SendResetEmailEvent>(_forgetPassword);
    on<VerifyCodeEvent>(_vrifyCode);
    on<ResetPasswordEvent>(_resetPassword);
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
        emit(
          state.copyWith(
            isvrifyCodeSent: true,
            email: event.email,
            errorEmail: '',
          ),
        );
        break;
      case ApiFailedResult<void>():
        final error = res.errorMessage;
        emit(state.copyWith(isvrifyCodeSent: false, errorEmail: error));
        break;
    }
  }

  void _vrifyCode(
    VerifyCodeEvent event,
    Emitter<ForgetPasswordState> emit,
  ) async {
    final res = await _verfityResetCodeUsecase.verifyResetCode(
      VerifyResetCodeRequest(event.code),
    );

    switch (res) {
      case ApiSucessResult<void>():
        emit(state.copyWith(isOtpCorrect: true, errorOtp: ''));
        break;
      case ApiFailedResult<void>():
        final error = res.errorMessage;
        emit(state.copyWith(isOtpCorrect: false, errorOtp: error));
        break;
    }
  }

  void _resetPassword(
    ResetPasswordEvent event,
    Emitter<ForgetPasswordState> emit,
  ) async {
    final res = await _resetPasswordUsecase.resetPassword(
      ResetPasswordRequest(email: state.email, newPass: event.newPassword),
    );
    switch (res) {
      case ApiSucessResult<void>():
        emit(state.copyWith(isPasswordReset: true, errorPassword: ''));
        break;
      case ApiFailedResult<void>():
        final error = res.errorMessage;
        emit(state.copyWith(isPasswordReset: false, errorPassword: error));
        break;
    }
  }

  bool validateForm(GlobalKey<FormState> formkey) {
    if (formkey.currentState!.validate()) {
      return true;
    }
    return false;
  }
}
