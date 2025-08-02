// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:exam_app/features/exam/domin/entity/answer_model.dart';
import 'package:exam_app/features/exam/domin/entity/exam_model.dart';
import 'package:exam_app/features/exam/domin/entity/subject_model.dart';

class QuestionsModel {
   List<AnswerModel>? answers;
    String? type;

    String? question;
    String? correct;
    SubjectModel? subject;
    ExamModel? exam;
    


  QuestionsModel({
    this.answers,
    this.type,

    this.question,
    this.correct,
     this.subject,
    this.exam,
 
  });
}
