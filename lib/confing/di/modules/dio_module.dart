import 'package:dio/dio.dart';
import 'package:exam_app/confing/di/di.dart';
import 'package:exam_app/confing/di/modules/token_interceptor.dart';

import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio provideDio() {
    final Dio dio = Dio();

    dio.interceptors.add(TokenInterceptor());
    dio.interceptors.add(getIt.get<PrettyDioLogger>());
    return dio;
  }

  @lazySingleton
  PrettyDioLogger prettyDioLoggerProvider() {
    return PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
    );
  }
}
