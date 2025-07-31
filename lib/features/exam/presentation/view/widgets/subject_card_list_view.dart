import 'package:exam_app/core/route/app_routes.dart';
import 'package:exam_app/features/exam/domin/entity/subject_model.dart';
import 'package:exam_app/features/exam/presentation/view/widgets/subject_card.dart';
import 'package:flutter/material.dart';

class SujectCardListView extends StatelessWidget {
  const SujectCardListView({super.key, required this.subjects});
  final List<SubjectModel> subjects;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: subjects.length,

        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 16),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.exams , arguments: subjects[index]);
              },
              child: SubjectCard(subject: subjects[index])),
          );
        },
      ),
    );
  }
}
