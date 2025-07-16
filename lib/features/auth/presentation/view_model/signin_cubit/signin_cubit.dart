
import 'package:exam_app/core/errors/failure.dart';
import 'package:exam_app/features/auth/api/model/signin_req_params.dart';
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
  await _signinUsecase.call(params: params).then(
      (value) => value.fold(
        (l)  {
          emit(SigninFailure(l));},
        (r) {
          emit(SigninSuccess());},
      ),
    );
  }

}
