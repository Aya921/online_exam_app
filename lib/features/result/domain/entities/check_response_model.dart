import 'package:exam_app/features/result/domain/entities/correct_question_model.dart';
import 'package:exam_app/features/result/domain/entities/wrong_question_model.dart';

class CheckResponseModel {
    String? message;
    int? correct;
    int? wrong;
    String? total;
    List<WrongQuestionModel>? wrongQuestions;
    List<CorrectQuestionModel>? correctQuestions;

    CheckResponseModel({
        this.message,
        this.correct,
        this.wrong,
        this.total,
        this.wrongQuestions,
        this.correctQuestions,
    });

   
}