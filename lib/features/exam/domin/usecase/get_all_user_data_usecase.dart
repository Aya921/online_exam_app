import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/features/exam/domin/entity/user_entity.dart';
import 'package:exam_app/features/exam/domin/repository/exam_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllUserDataUsecase {
  final ExamRepository _examRepository;

  GetAllUserDataUsecase(this._examRepository);

  Future<ApiResult<UserEntity>> call() async {
    return await _examRepository.getProfileData();
  }
}
