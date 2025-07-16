

import 'package:dartz/dartz.dart';
import 'package:exam_app/core/errors/failure.dart';
import 'package:exam_app/features/auth/api/model/signin_req_params.dart';
import 'package:exam_app/features/auth/domin/entities/user_entity.dart';

abstract class AuthRepo {

  Future<Either<Failure, UserEntity>> signIn(SigninReqParams params);
  
}
