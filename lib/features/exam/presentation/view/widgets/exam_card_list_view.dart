import 'package:exam_app/core/route/app_routes.dart';
import 'package:exam_app/features/exam/domin/entity/exam_model.dart';
import 'package:exam_app/features/exam/presentation/view/widgets/exam_card.dart';
import 'package:flutter/material.dart';

class ExamCardListView extends StatelessWidget {
  const ExamCardListView({
    super.key,
    required this.exams,
    required this.subjectName,
  });
  final List<ExamModel> exams;
  final String subjectName;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.startExam,
                  arguments: <String, dynamic>{
                    'exam': exams[index],
                    'subjectName': subjectName,
                  },
                );
              },
              child: ExamCard(exam: exams[index]),
            ),
          );
        },
      ),
    );
  }
}
