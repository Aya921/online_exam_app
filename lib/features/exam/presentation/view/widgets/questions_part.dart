import 'package:exam_app/core/constant/constant.dart';
import 'package:exam_app/core/constant/pages_constants/page_constants.dart';
import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/exam/domin/entity/question_model.dart';
import 'package:exam_app/features/exam/presentation/view/widgets/custum_check_box.dart';
import 'package:exam_app/features/exam/presentation/view/widgets/custum_radio.dart';
import 'package:exam_app/features/exam/presentation/view/widgets/custum_timer.dart';
import 'package:exam_app/features/exam/presentation/view_models/qustion_view_model/quesion_events.dart';
import 'package:exam_app/features/exam/presentation/view_models/qustion_view_model/quesion_state.dart';
import 'package:exam_app/features/exam/presentation/view_models/qustion_view_model/quesion_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

// ignore: must_be_immutable
class QuestionsPart extends StatefulWidget {
  List<QuestionsModel>? questioinsListModel;
  QustionViewModel qustionViewModel;
  String examId;

  QuestionsPart({
    super.key,
    this.questioinsListModel,
    required this.qustionViewModel,
    required this.examId,
  });

  @override
  State<QuestionsPart> createState() => _QuestionsPartState();
}

class _QuestionsPartState extends State<QuestionsPart> {
  String? group;
  int qNumber = 1;
  int pageIndex = 0;
  bool chooseTypes = false;
  late List<QuestionsModel> questioinsList;
  late List<List<String?>?> studentAnswers = [];

  late List<String> correctAnswers = [];

  @override
  void initState() {
    widget.qustionViewModel.add(
      StartTimerEvent(duration: widget.questioinsListModel![0].exam!.duration!),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final width = MediaQuery.of(context).size.width;

    questioinsList = widget.questioinsListModel!;
    final examModel = questioinsList[pageIndex].exam;
    final subjectModel = questioinsList[pageIndex].subject;
    final answrers = questioinsList[pageIndex].answers;
    final question = questioinsList[pageIndex].question;

    final int numberOfQ = questioinsList.length + 1;
    final type = questioinsList[pageIndex].type;
    final duration = examModel!.duration;

    if (type == Constant.singleChoice) {
      chooseTypes = true;
    }

    if (studentAnswers.length != numberOfQ) {
      studentAnswers = List.filled(numberOfQ, []);

      for (int i = 0; i < studentAnswers.length; i++) {
        studentAnswers[i] = List.filled(answrers!.length, 'AA');
      }
    }

    return BlocListener<QustionViewModel, QuestionState>(
      listenWhen: (previous, current) {
        return (previous.studentAswers != current.studentAswers);
      },
      listener: (context, state) {
        studentAnswers = state.studentAswers;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),

          title: Text(t.exam),

          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Image.asset(Constant.questionPageIconUrl, width: 35),
                  const SizedBox(width: 10),

                  CustumTimer(duration: duration!),
                ],
              ),
            ),
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.all(16.0),

          child: Column(
            children: [
              Column(
                children: [
                  Text(
                    "${t.question} $qNumber ${t.ofWord} ${numberOfQ - 1}",
                    style: const TextStyle(color: AppColors.black),
                  ),
                  LinearPercentIndicator(
                    alignment: MainAxisAlignment.center,
                    padding: const EdgeInsets.all(0),
                    width: width * 0.9,
                    progressColor: AppColors.blue,
                    backgroundColor: AppColors.lightGray,
                    percent: qNumber / (numberOfQ - 1),
                    animation: true,
                    animateFromLastPercent: true,
                  ),
                ],
              ),
              const SizedBox(height: 40),

              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  question!,
                  style: const TextStyle(
                    fontSize: 20,
                    color: AppColors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 30),
              //questions section
              SizedBox(
                height: 300,

                child: chooseTypes
                    ? RadioTile(
                        answrers: answrers!,
                        qNumber: qNumber,
                        qustionViewModel: widget.qustionViewModel,
                        studentAnswer: studentAnswers,

                        group: studentAnswers[qNumber]![0],
                      )
                    : CheckBoxTile(
                        answrers: answrers!,
                        qNumber: qNumber,
                        qustionViewModel: widget.qustionViewModel,
                        studentAnswerCheckBox: studentAnswers,
                      ),
              ),

              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (pageIndex > 0) {
                          setState(() {
                            pageIndex--;
                            qNumber--;
                          });
                        }
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
                      child: Text(t.back),
                    ),
                    const SizedBox(width: 20),

                    ElevatedButton(
                      onPressed: () {
                        if (qNumber < numberOfQ - 1) {
                          setState(() {
                            pageIndex++;
                            qNumber++;
                          });
                        } else {
                          Navigator.of(context).pushReplacementNamed(
                            AppRoutes.score,
                            arguments: {
                              PageConstants.questionListArg: questioinsList,
                              PageConstants.studentAnswerArg: studentAnswers,
                              PageConstants.examModelArg: examModel,
                              PageConstants.subjectNameArg: subjectModel!.name,
                              PageConstants.timerArg:
                                  widget.qustionViewModel.state.seconds,
                            },
                          );
                        }
                      },

                      child: Text(qNumber == numberOfQ - 1 ? t.finish : t.next),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
