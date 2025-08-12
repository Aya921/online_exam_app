import 'package:exam_app/core/l10n/translations/app_localizations.dart';

import 'package:exam_app/features/exam/presentation/view/widgets/custum_show_dialog.dart';
import 'package:exam_app/features/exam/presentation/view/widgets/questions_part.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:exam_app/confing/di/di.dart';

import 'package:exam_app/features/exam/presentation/view_models/qustion_view_model/quesion_events.dart';
import 'package:exam_app/features/exam/presentation/view_models/qustion_view_model/quesion_state.dart';
import 'package:exam_app/features/exam/presentation/view_models/qustion_view_model/quesion_view_model.dart';

class QuesionsPage extends StatefulWidget {
  const QuesionsPage({super.key, required this.emailId});
  final String emailId;

  @override
  State<QuesionsPage> createState() => _QuesionsPageState();
}

class _QuesionsPageState extends State<QuesionsPage> {
  late QustionViewModel qustionViewModel;

  @override
  void initState() {
    super.initState();
    qustionViewModel = getIt.get<QustionViewModel>();
  }

  @override
  void dispose() {
    qustionViewModel.close();

    super.dispose();
  }

  late List<List<String?>?> studentAnswers = [];

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) =>
          qustionViewModel..add(GetQuestionsEvent(emailId: widget.emailId)),

      child: BlocBuilder<QustionViewModel, QuestionState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          if (state.errorMessage != null) {
            return Scaffold(body: Center(child: Text("${state.errorMessage}")));
          }
          if (state.isTimeEnd) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              showMyDialog(
                context,
                qustionViewModel,
                state.questionsList!,
                state.studentAswers,
              );
              state.isTimeEnd = false;
            });
          }

          if (state.questionsList != null) {
            return QuestionsPart(
              qustionViewModel: qustionViewModel,
              questioinsListModel: state.questionsList,

              examId: widget.emailId,
            
            );
          } else {
            return Text(t.unExpectedError);
          }
        },
      ),
    );
  }
}
