
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:exam_app/features/exam/domin/entity/questions_answers_model.dart';
import 'package:exam_app/features/exam/domin/entity/exam_model.dart';
import 'package:exam_app/features/exam/domin/entity/subject_model.dart';

class QuestionsModel {
  List<QuestionsAnswersModel>? answers;
  String? type;
  String? id;
  String? question;
  String? correct;
  SubjectModel? subject;
  ExamModel? exam;

  QuestionsModel({
    this.answers,
    this.type,
     this.id,


    this.question,
    this.correct,
    this.subject,
    this.exam,
  });
}

