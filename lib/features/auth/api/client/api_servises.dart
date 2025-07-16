import 'package:dio/dio.dart';
import 'package:exam_app/features/auth/api/model/SignInRespones.dart';


import 'package:injectable/injectable.dart';

import 'package:retrofit/retrofit.dart';


part 'api_servises.g.dart';

@RestApi()
@injectable
abstract class ApiServises {

  @factoryMethod
  factory ApiServises(Dio dio) = _ApiServises;
  @POST('/auth/signin')
  Future<SigninRespones> signIn(@Body() Map<String, dynamic> body);
  
}
