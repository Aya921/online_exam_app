import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/exam/domin/entity/question_model.dart';
import 'package:exam_app/features/exam/presentation/view_models/qustion_view_model/quesion_view_model.dart';
import 'package:flutter/material.dart';

Future<dynamic> showMyDialog(
  BuildContext context,
  QustionViewModel qustionViewModel,
  List<QuestionsModel> questionList,
  List<List<String?>?> studentanswers,
) {
  final t = AppLocalizations.of(context)!;
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(t.timeOut, style: const TextStyle(color: AppColors.red)),
              ],
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: () {
                qustionViewModel.state.copyWith(isTimeEnd: false);

              },
              child: ElevatedButton(onPressed: (){}, child: Text(t.viewScore))
            ),
          ],
        ),
      ),
    ),
  );
}
