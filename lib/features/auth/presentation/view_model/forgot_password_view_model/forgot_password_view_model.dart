import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/auth/domin/usecases/forget_password_usecase.dart';
import 'package:exam_app/features/auth/presentation/view_model/forgot_password_view_model/forgot_password_events.dart';
import 'package:exam_app/features/auth/presentation/view_model/forgot_password_view_model/forgot_password_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgotPasswordViewModel
    extends Bloc<ForgotPasswordEvents, ForgotPasswordStates> {
  final ForgetPasswordUsecase _forgetPasswordUsecase;
  final GlobalKey<FormState> formKey = GlobalKey();

  ForgotPasswordViewModel(this._forgetPasswordUsecase)
    : super(ForgotPasswordStates()) {
    on<SendForgotPasswordEmailEvent>(_sendForgotPasswordEmail);
    on<ValidateForgotPasswordEvent>(_checkValidation);
  }

  void _checkValidation(ValidateForgotPasswordEvent event, Emitter emit) {
    final valid = formKey.currentState!.validate();
   
    emit(state.copyWith(isValid: valid));
  }


 

  Future<void> _sendForgotPasswordEmail(
    SendForgotPasswordEmailEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final res = await _forgetPasswordUsecase.forgetPassword(event.email);
    switch (res) {
      case ApiSucessResult<void>():
        emit(state.copyWith(isLoading: false, isSuccess: true));

      case ApiFailedResult<void>():
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: res.errorMessage,
            isSuccess: false,
          ),
        );
    }

    //
  }
}
