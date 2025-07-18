
import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/auth/api/model/signin_req_params.dart';
import 'package:exam_app/features/auth/domin/entities/user_entity.dart';
import 'package:exam_app/features/auth/domin/usecases/signin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
part 'signin_state.dart';

@injectable
class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this._signinUsecase) : super(SigninInitial());
  final SigninUsecase _signinUsecase;
  void signIn(SigninReqParams params) async {
    emit(SigninLoading());
    var result = await _signinUsecase.call(params: params);
    switch (result) {
      case ApiSucessResult<UserEntity>():
        emit(SigninSuccess());
        break;
      case ApiFailedResult<UserEntity>() :
        emit(SigninFailure(result.errorMessage));
        break;
      }

  }

}
