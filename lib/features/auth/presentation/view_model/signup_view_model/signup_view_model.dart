// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:exam_app/features/auth/domin/usecases/signup_usecase.dart';

import 'package:exam_app/features/auth/presentation/view_model/signup_view_model/signup_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/auth/domin/entities/user_entity.dart';


@injectable
class SignupViewModel extends Cubit<SignupState> {
  final SignupUseCase _signupUseCase;
  SignupViewModel(this._signupUseCase) : super(SignupIntialState());

   final GlobalKey<FormState> formKey = GlobalKey();


  void checkValidation() {
    final valid = formKey.currentState!.validate();
    emit(SignupValidState(isValid: valid));
  }


  
  


  Future<void> signup(UserModel usermodel) async {
    emit(SignupLoadingState());

    final res = await _signupUseCase.signUp(usermodel);
    switch (res) {
      case ApiSucessResult<UserModel>():
        emit(SignupSucessState(userModel: res.sucessResult));

      case ApiFailedResult<UserModel>():
        emit(SignupFaliedState(errorMessage: res.errorMessage));
    }
  }
}
