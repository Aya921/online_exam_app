
import 'package:exam_app/features/exam/data/source/exam_data_source.dart';

import 'package:exam_app/features/exam/domin/repository/exam_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExamRepository)
class ExamRepositoryImp implements ExamRepository {
  final ExamDataSource _examDataSource;
  ExamRepositoryImp(this._examDataSource);


  
}
