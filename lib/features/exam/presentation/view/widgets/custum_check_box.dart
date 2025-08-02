// ignore: must_be_immutable
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/exam/domin/entity/answer_model.dart';
import 'package:exam_app/features/exam/presentation/view_models/qustion_view_model/quesion_view_model.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckBoxTile extends StatefulWidget {
  List<AnswerModel> answrers;
  int qNumber;
  QustionViewModel qustionViewModel;
  List<List<String?>?> studentAnswerCheckBox;

  CheckBoxTile({
    super.key,
    required this.answrers,
    required this.qNumber,
    required this.studentAnswerCheckBox,
    required this.qustionViewModel,
  });

  @override
  State<CheckBoxTile> createState() => _CheckBoxTileState();
}

class _CheckBoxTileState extends State<CheckBoxTile> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        final answer = widget.answrers[index];
        final key = answer.key;

        return Column(
          children: [
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: AppColors.black,
              title: Text(
                answer.answer!,
                style: const TextStyle(color: AppColors.black),
              ),
              //selected: widget.group == key,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),

              tileColor: AppColors.lightBlue,
              selectedTileColor: AppColors.blue[100],
              fillColor:const  WidgetStatePropertyAll(AppColors.blue),
              selected:widget.studentAnswerCheckBox[widget.qNumber]![index]!
                  .contains(key!) ,

              value: widget.studentAnswerCheckBox[widget.qNumber]![index]!
                  .contains(key),

              onChanged: (val) {
                setState(() {
                  if (val == true) {
                    widget.studentAnswerCheckBox[widget.qNumber]![index] = key;
                  } else {
                    widget.studentAnswerCheckBox[widget.qNumber]![index] = '';
                  }
                });
              },
            ),

            const SizedBox(height: 25),
          ],
        );
      },
    );
  }
}

