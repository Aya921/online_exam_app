import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/auth/domin/entities/signin_req.dart';

import 'package:exam_app/features/auth/domin/entities/user_entity.dart';
import 'package:exam_app/features/auth/domin/usecases/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
part 'signin_state.dart';

@injectable
class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this._signinUsecase) : super(SigninInitial());
  final SigninUsecase _signinUsecase;

  final GlobalKey<FormState> formKey = GlobalKey();

  bool checkValidation() {
    final bool valid = formKey.currentState!.validate();
    return valid;
  }

  void signIn(SignInRequest params) async {
    emit(SigninLoading());
    final result = await _signinUsecase.call(params);
    switch (result) {
      case ApiSucessResult<UserModel>():
        emit(SigninSuccess());
        break;
      case ApiFailedResult<UserModel>():
        emit(SigninFailure(result.errorMessage));
        break;
    }
  }
}
