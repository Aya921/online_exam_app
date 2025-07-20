// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:exam_app/features/auth/domin/usecases/signup_usecase.dart';
import 'package:exam_app/features/auth/presentation/view_model/signup_view_model/signup_events.dart';

import 'package:exam_app/features/auth/presentation/view_model/signup_view_model/signup_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/auth/domin/entities/user_entity.dart';

@injectable
class SignupViewModel extends Bloc<SignupEvent, SignupState> {
  final SignupUseCase _signupUseCase;
  final GlobalKey<FormState> formKey = GlobalKey();
  SignupViewModel(this._signupUseCase) : super(SignupState()) {
    on<SignUpUserEvent>(_signup);
    on<ValidateSignupEvent>(_checkValidation);
  }

  void _checkValidation(ValidateSignupEvent event, Emitter emit) {
    final valid = formKey.currentState!.validate();
    emit(state.copyWith(isValid: valid));
    //emit(SignupValidState(isValid: valid));
  }

  Future<void> _signup(SignUpUserEvent event, Emitter emit) async {
    //emit(SignupLoadingState());
    emit(state.copyWith(isLoading: true));

    final res = await _signupUseCase.signUp(event.signupRequest);
    switch (res) {
      case ApiSucessResult<UserModel>():
        emit(
          state.copyWith(
            isLoading: false,
            userModel: res.sucessResult,
            isValid: true,
          ),
        );

      case ApiFailedResult<UserModel>():
        emit(
          state.copyWith(
            isLoading: false,
            errorMessage: res.errorMessage,
            isValid: false,
          ),
        );
    }
  }
}
