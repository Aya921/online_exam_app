import 'package:dio/dio.dart';
import 'package:exam_app/core/constant/endPoints_constants/endpoints.dart';
import 'package:exam_app/features/auth/api/model/SignInRespones.dart';
import 'package:exam_app/features/auth/api/model/signin_req_params.dart';


import 'package:injectable/injectable.dart';

import 'package:retrofit/retrofit.dart';


part 'api_servises.g.dart';

@RestApi()
@injectable
abstract class ApiServises {

  @factoryMethod
  factory ApiServises(Dio dio) = _ApiServises;
  @POST(Endpoints.signinEndPoint)
  Future<SigninRespones> signIn(@Body() Map<String, dynamic> params);
  
}
