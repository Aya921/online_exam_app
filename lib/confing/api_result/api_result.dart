import 'package:dio/dio.dart';

sealed class ApiResult<t> {}

class ApiSucessResult<T> extends ApiResult<T> {
  T sucessResult;
  ApiSucessResult(this.sucessResult);
}

class ApiFailedResult<T> extends ApiResult<T> {
  String errorMessage;
  ApiFailedResult(this.errorMessage);

  factory ApiFailedResult.fomDioException(DioException error) {
    switch (error.response?.statusCode) {
      case 400:
        return ApiFailedResult('Bad Request: ${error.message}');
      case 401:
        return ApiFailedResult('invalid Email or Password!');
      case 403:
        return ApiFailedResult('Forbidden: ${error.message}');
      case 404:
        return ApiFailedResult('Not Found: ${error.message}');
      case 500:
        return ApiFailedResult('Internal Server Error: ${error.message}');
      default:
        return ApiFailedResult('Unexpected error: ${error.message}');
    }
    
  }
}
