import 'dart:developer';

import 'package:exam_app/confing/api_result/api_result.dart';
import 'package:exam_app/confing/di/di.dart';
import 'package:exam_app/features/exam/domin/entity/exam_model.dart';
import 'package:exam_app/features/exam/domin/entity/subject_model.dart';
import 'package:exam_app/features/exam/domin/repository/exam_repository.dart';
import 'package:flutter/material.dart';

class SubjectPage extends StatelessWidget {
  const SubjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Subjects')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final result = await getIt<ExamRepository>().getExamONSubjectById(
              '670038f7728c92b7fdf43501',
            );
            switch (result) {
              case final ApiSucessResult<List<ExamModel>> success:
                log('Subjects: ${success.sucessResult[0].title}');
                break;
              case final ApiFailedResult failed:
                log('Error: ${failed.errorMessage}');
                break;
            }
          },
          child: Text('get all subjects'),
        ),
      ),
    );
  }
}
