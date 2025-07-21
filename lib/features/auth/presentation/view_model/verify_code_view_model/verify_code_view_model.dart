import 'package:exam_app/confing/api_result/api_result.dart';

import 'package:exam_app/features/auth/domin/usecases/verfity_reset_code_usecase.dart';

import 'package:exam_app/features/auth/presentation/view_model/verify_code_view_model/verify_code_events.dart';
import 'package:exam_app/features/auth/presentation/view_model/verify_code_view_model/verify_code_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable

class VerifyCodeViewModel extends Bloc<VerifyCodeEvents, VerifyCodeState> {
  final  VerfityResetCodeUsecase _verfityResetCodeUsecas;
   

  VerifyCodeViewModel(this._verfityResetCodeUsecas)
    : super(VerifyCodeState()) {
  
    on<VerifyEmailCodeEvent>(_verifyCode);
  }

  

  Future<void> _verifyCode(
    VerifyEmailCodeEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(isLoading: true));

    final res = await _verfityResetCodeUsecas.verifyResetCode(event.verifyResetCodeRequest);
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
