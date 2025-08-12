import 'package:dio/dio.dart';
import 'package:exam_app/core/constant/endPoints_constants/endpoints.dart';
import 'package:exam_app/features/result/api/models/check_request/student_answers_dto.dart';
import 'package:exam_app/features/result/api/models/check_response/check_response_dto.dart';

import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';


part 'api_service.g.dart';

@RestApi(baseUrl: Endpoints.apiUrl)
@injectable
abstract class ResultApiService {
  @factoryMethod
  factory ResultApiService(Dio dio) = _ResultApiService;


  @POST(Endpoints.quesions + Endpoints.check)
  Future<CheckResponseDto> getResult(@Body() StudentAnswerDto studentAnswer);
}
