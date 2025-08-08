import 'dart:math';

import 'package:exam_app/confing/di/di.dart';
import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/core/route/app_routes.dart';
import 'package:exam_app/features/exam/domin/entity/exam_model.dart';
import 'package:exam_app/features/exam/domin/entity/question_model.dart';
import 'package:exam_app/features/exam/presentation/view/widgets/row_score.dart';
import 'package:exam_app/features/result/presentation/view/widgets/custum_circular_percent.dart';
import 'package:exam_app/features/result/presentation/view_Model/result_event.dart';
import 'package:exam_app/features/result/presentation/view_Model/result_state.dart';
import 'package:exam_app/features/result/presentation/view_Model/result_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:exam_app/core/theme/app_colors.dart';

// ignore: must_be_immutable
class ScorePage extends StatelessWidget {
  late List<QuestionsModel> qustionList;
  late List<List<String?>?> studentanswers;
  ExamModel exam;
  String subjectName;

  ScorePage({
    super.key,
    required this.qustionList,
    required this.studentanswers,
    required this.exam,
    required this.subjectName,
  });
  late int? correct;
  late int? wrong;
  final ResultViewModel _resultViewModel = getIt.get<ResultViewModel>();
  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.popAndPushNamed(
              context,
              AppRoutes.startExam,
              arguments: {'exam': exam, 'subjectName': subjectName},
            );
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(t.examscore),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocProvider(
          create: (context) => _resultViewModel
            ..add(
              GetResultEvent(
                studentanswers: studentanswers,
                questionsModel: qustionList,
              ),
            ),

          child: BlocBuilder<ResultViewModel, ResultState>(
            builder: (context, state) {
              if (state.isLoading == true) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state.checkResponseModel != null) {
                correct = state.checkResponseModel!.correct;
                wrong = state.checkResponseModel!.wrong;
                final double value = double.parse(
                  state.checkResponseModel!.total!.replaceAll('%', ''),
                );
                final double greenPercent = (value) / 100;

                bool correctt = false;
                if (greenPercent != 0) {
                  correctt = true;
                }
                const double gapPercent = 0.02;
                final double redPercent = correctt
                    ? 1 - greenPercent - 2 * gapPercent
                    : 1;

                final double redStartAngle =
                    2 * pi * (greenPercent + gapPercent);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                      child: Text(
                        "Your Score",
                        style: TextStyle(fontSize: 20, color: AppColors.black),
                      ),
                    ),

                    Row(
                      children: [
                        CustumCircularPerecent(
                          greenPercent: greenPercent,
                          redStartAngle: redStartAngle,
                          redPercent: redPercent,
                        ),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Score(
                                  colorUsed: AppColors.blue,
                                  txt: t.correct,
                                  score: correct!,
                                ),
                                const SizedBox(height: 10),
                                Score(
                                  colorUsed: AppColors.red,
                                  txt: t.incorrect,
                                  score: wrong!,
                                ),

                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    Align(
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 80),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(
                                    context,
                                  ).pushNamed(AppRoutes.result);
                                },
                                child: Text(t.showResults),
                              ),

                              const SizedBox(height: 20),

                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacementNamed(
                                    AppRoutes.question,
                                    arguments: exam.id,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.transperant,
                                  foregroundColor: AppColors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(
                                      color: AppColors.blue,
                                      width: 1.5,
                                    ),
                                  ),
                                ),
                                child: Text(t.startAgain),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              if (state.errorMessage != null) {
                return Text(state.errorMessage!);
              } else {
                return const Text("oops");
              }
            },
          ),
        ),
      ),
    );
  }
}
