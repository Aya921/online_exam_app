import 'package:dio/dio.dart';
import 'package:exam_app/core/constant/endPoints_constants/endpoints.dart';
import 'package:exam_app/features/exam/api/model/questions_response/question_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:exam_app/core/constant/json_serializable_constants/json_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: Endpoints.apiUrl)
@injectable
abstract class ExamApiService {
  @factoryMethod
  factory ExamApiService(Dio dio) = _ExamApiService;

  @GET(Endpoints.quesions)
  Future<QuesionsResponse> getQuestions({@Query(JsonConstants.exam) required String exam});
}
