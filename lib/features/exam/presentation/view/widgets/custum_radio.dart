// ignore: must_be_immutable
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/exam/domin/entity/answer_model.dart';
import 'package:exam_app/features/exam/presentation/view_models/qustion_view_model/quesion_events.dart';
import 'package:exam_app/features/exam/presentation/view_models/qustion_view_model/quesion_view_model.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RadioTile extends StatefulWidget {
  List<AnswerModel> answrers;
  int qNumber;
  QustionViewModel qustionViewModel;
 List<List<String?>?> studentAnswer;
  String? group;

  RadioTile({
    super.key,
    required this.answrers,
    required this.qNumber,
    required this.qustionViewModel,
    required this.studentAnswer,
    this.group,
  });

  @override
  State<RadioTile> createState() => _RadioTileState();
}

class _RadioTileState extends State<RadioTile> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.answrers.length,
      itemBuilder: (context, index) {
        final answer = widget.answrers[index];
        final String key = answer.key!;

        return Column(
          children: [
            RadioListTile(
              activeColor: AppColors.black,
              title: Text(
                answer.answer!,
                style: const TextStyle(color: AppColors.black),
              ),
              selected: widget.group == key,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),

              tileColor: AppColors.lightBlue,
              selectedTileColor: AppColors.blue[100],
              fillColor: const WidgetStatePropertyAll(AppColors.blue),

              value: key,
              groupValue: widget.group,
              onChanged: (val) {
                setState(() {
                  widget.group = val;
                });
                //widget.studentAnswer[widget.qNumber] = val!;
                widget.qustionViewModel.add(
                  UpdateStudentAnswerEvent(
                    answers: widget.studentAnswer,
                    index: widget.qNumber,
                    value: val!,
                  ),
                );
              },
            ),

            const SizedBox(height: 25),
          ],
        );
      },
    );
  }
}

