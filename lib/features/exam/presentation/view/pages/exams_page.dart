import 'package:exam_app/confing/di/di.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/exam/domin/entity/subject_model.dart';
import 'package:exam_app/features/exam/presentation/view/widgets/cubit_exam_card_list_view.dart';
import 'package:exam_app/features/exam/presentation/view_models/exams_view_model/cubit/exams_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamsPage extends StatelessWidget {
  ExamsPage({super.key, required this.subject});
  final SubjectModel subject;
  final viewModel = getIt<ExamsCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.black,
              size: 24,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            subject.name!,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CubitExamCardListView(subjectId: subject.id! , 
            subjectName: subject.name!),
            
        ),
      ),
    );
  }
}
