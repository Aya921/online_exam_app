import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/core/route/app_routes.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/exam/domin/entity/question_model.dart';
import 'package:exam_app/features/exam/presentation/view_models/qustion_view_model/quesion_events.dart';
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
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 60,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.blue, width: 1.5),
                ),
                child: Text(
                  t.viewScore,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
