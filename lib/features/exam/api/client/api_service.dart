import 'package:dio/dio.dart';
import 'package:exam_app/core/constant/endPoints_constants/endpoints.dart';
import 'package:exam_app/features/exam/api/model/profile_data_respone/profile_data_respone.dart';

import 'package:exam_app/features/exam/api/model/subject_response/get_all_exams_on_subject/get_all_exams_on_subject.dart';
import 'package:exam_app/features/exam/api/model/subject_response/get_all_subjects_respone/get_all_subjects_respone.dart';


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

  @GET(Endpoints.auth+Endpoints.profileData)
  Future<ProfileDataRespone> getProfileData();


  @GET(Endpoints.subjects)
  Future<GetAllSubjectsRespone> getAllSubjects();
  @GET(Endpoints.exams)
  Future<GetAllExamsOnSubject> getAllExamsOnSubjects(@Query(Endpoints.subject) String subject);

  @GET(Endpoints.quesions)
  Future<QuesionsResponse> getQuestions({@Query(JsonConstants.exam) required String exam});

}
