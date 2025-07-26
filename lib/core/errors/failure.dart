import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure("Connection Timeout");
      case DioExceptionType.sendTimeout:
        return const ServerFailure("Send Timeout");
      case DioExceptionType.receiveTimeout:
        return const ServerFailure("Receive Timeout");
      case DioExceptionType.badResponse:
        return const ServerFailure('invalid email or password');
      case DioExceptionType.cancel:
        return const ServerFailure("Request Cancelled");
      case DioExceptionType.connectionError:
        return const ServerFailure("Connection Error");
      default:
        return const ServerFailure("Unexpected Error");
    }
  }
}
