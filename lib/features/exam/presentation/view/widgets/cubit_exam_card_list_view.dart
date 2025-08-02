import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/features/exam/presentation/view/widgets/exam_card_list_view.dart';
import 'package:exam_app/features/exam/presentation/view_models/exams_view_model/cubit/exams_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitExamCardListView extends StatefulWidget {
  const CubitExamCardListView({
    super.key,
    required this.subjectId,
    required this.subjectName,
  });
  final String subjectId;
  final String subjectName;

  @override
  State<CubitExamCardListView> createState() => _ExamCardListViewState();
}

class _ExamCardListViewState extends State<CubitExamCardListView> {
  @override
  void initState() {
    context.read<ExamsCubit>().getExamsOnSubject(widget.subjectId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     final t = AppLocalizations.of(context)!;
    return BlocBuilder<ExamsCubit, ExamsState>(
      builder: (context, state) {
        if (state is ExamsLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ExamsSuccess) {
          if (state.exams.isEmpty) {
            return  Center(child: Text(t.noExamsAvailable));
          }
          return Column(
            children: [
              ExamCardListView(
                exams: state.exams,
                subjectName: widget.subjectName,
              ),
            ],
          );
        } else if (state is ExamsFailed) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center();
        }
      },
    );
  }
}
