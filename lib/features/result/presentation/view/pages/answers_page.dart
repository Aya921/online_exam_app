import 'package:exam_app/confing/di/di.dart';
import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/result/domain/entities/correct_question_model.dart';
import 'package:exam_app/features/result/domain/entities/result_model.dart';
import 'package:exam_app/features/result/domain/entities/wrong_question_model.dart';
import 'package:exam_app/features/result/presentation/view/widgets/custum_row.dart';
import 'package:exam_app/features/result/presentation/view_Model/result_event.dart';
import 'package:exam_app/features/result/presentation/view_Model/result_state.dart';
import 'package:exam_app/features/result/presentation/view_Model/result_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnswersPage extends StatefulWidget {
  final ResultModel resultList;
  const AnswersPage({super.key, required this.resultList});

  @override
  State<AnswersPage> createState() => _AnswersPageState();
}

class _AnswersPageState extends State<AnswersPage> {
  late final List<String> questionIds;
  late final List<WrongQuestionModel> wrongAnswers;
  late final List<CorrectQuestionModel> correctAnswers;
  late final ResultViewModel _resultViewModel;

  @override
  void initState() {
    super.initState();
    _resultViewModel = getIt.get<ResultViewModel>();
    questionIds = widget.resultList.questions.map((q) => q.id!).toList();
    wrongAnswers = widget.resultList.answers.wrongQuestions!;
    correctAnswers = widget.resultList.answers.correctQuestions!;
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => _resultViewModel
        ..add(
          CheckCorrectAndWrongContainersEvent(
            questionIds: questionIds,
            wrongAnswers: wrongAnswers,
            correctAnswers: correctAnswers,
          ),
        ),
      child: Scaffold(
        appBar: AppBar(
          title:  Text(t.answers),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: BlocBuilder<ResultViewModel, ResultState>(
            builder: (context, state) {
              if (state.containerWrongNumber != null ||
                  state.containerCorrectNumber != null) {
                final correct = state.containerCorrectNumber!;
                final wrong = state.containerWrongNumber!;
                return ListView.builder(
                  itemCount: widget.resultList.questions.length,
                  itemBuilder: (context, index) {
                    final questionList = widget.resultList.questions[index];
                    final int wrongcontainerNumber = wrong[index];
                    final int correctcontainerNumber = correct[index];

                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${questionList.question}',
                              style: const TextStyle(color: AppColors.black),
                            ),

                            const SizedBox(height: 15),

                            SizedBox(
                              child: CustumRow(
                                questionList: questionList,
                                correctcontainerNumber: correctcontainerNumber,
                                wrongcontainerNumber: wrongcontainerNumber,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
