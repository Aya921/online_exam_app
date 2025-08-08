import 'package:exam_app/features/exam/domin/entity/exam_model.dart';

class ResultModel {
  String subjectName;
  double seconds;
  int correct;
 ExamModel exam;
  ResultModel({
    required this.subjectName,
    required this.seconds,
    required this.correct,
   required this.exam,
  });

  
}
