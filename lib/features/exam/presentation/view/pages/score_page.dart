
import 'dart:math';

import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/core/route/app_routes.dart';

import 'package:exam_app/features/exam/presentation/view/widgets/custum_buttom.dart';
import 'package:exam_app/features/exam/presentation/view/widgets/custum_circular_percent.dart';
import 'package:exam_app/features/exam/presentation/view/widgets/row_score.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/exam/presentation/view_models/qustion_view_model/quesion_state.dart';
import 'package:exam_app/features/exam/presentation/view_models/qustion_view_model/quesion_view_model.dart';


// ignore: must_be_immutable
class ScorePage extends StatelessWidget {
  late QustionViewModel? qustionViewModel;
  ScorePage({super.key, this.qustionViewModel});

  late int correct;
  late int wrong;

  @override
  Widget build(BuildContext context) {
     final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        title:  Text(t.examscore),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: BlocProvider(
          create: (context) => qustionViewModel!,
          child: BlocBuilder<QustionViewModel, QuestionState>(
            builder: (context, state) {
              if (state.wrong != null && state.correct != null) {
                correct = state.correct!;
                wrong = state.wrong!;
                final double greenPercent = correct / state.nQuestion;
          
                bool correctt = false;
                if (greenPercent != 0) {
                  correctt = true;
                }
                const  double gapPercent = 0.02;
                 final double redPercent = correctt
                    ? 1 - greenPercent - 2 * gapPercent
                    : 1;
              

                final double redStartAngle = 2 * pi * (greenPercent + gapPercent);

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
                        CustumCircularPerecent(greenPercent: greenPercent, redStartAngle: redStartAngle, redPercent: redPercent),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Score(
                                  colorUsed: AppColors.blue,
                                  txt: t.correct,
                                  score: correct,
                                ),
                                const SizedBox(height: 10),
                                Score(
                                  colorUsed: AppColors.red,
                                  txt: t.incorrect,
                                  score: wrong,
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
                              InkWell(
                                onTap: () {},

                                child:  CustumButtom(
                                  txt: t.showResults,
                                  color: AppColors.blue,
                                  fontColor: AppColors.white,
                                  circularRaduis: 30,
                                ),
                              ),

                              const SizedBox(height: 20),

                              InkWell(
                                onTap: () {
                                  qustionViewModel!.state.copyWith(
                                    isTimeEnd: false,
                                  );
                                  Navigator.of(
                                    context,
                                  ).pushReplacementNamed(AppRoutes.question);
                                },
                                child:  CustumButtom(
                                  txt: t.startAgain,
                                  borderColor: AppColors.blue,
                                  circularRaduis: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return  Text(t.unExpectedError);
              }
            },
          ),
        ),
      ),
    );
  }
}

