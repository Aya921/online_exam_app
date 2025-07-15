import 'package:dio/dio.dart';


import 'package:injectable/injectable.dart';

import 'package:retrofit/retrofit.dart';


part 'api_servises.g.dart';

@RestApi()
@injectable
abstract class ApiServises {

  @factoryMethod
  factory ApiServises(Dio dio) = _ApiServises;

  
}
