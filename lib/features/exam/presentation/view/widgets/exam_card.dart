import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/exam/domin/entity/exam_model.dart';
import 'package:flutter/material.dart';

class ExamCard extends StatelessWidget {
  const ExamCard({super.key, required this.exam});
  final ExamModel exam;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              spreadRadius: 3,
              color: AppColors.gray.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0.5, 1),
            ),
          ],
        ),
        child: SizedBox(
          height: 103,

          child: Row(
            children: [
              const SizedBox(width: 24),
              Image.asset('assets/images/exam.png'),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 24,
                    top: 16,
                    bottom: 16,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            exam.title!,
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Text(
                            '${exam.duration} ${t!.minutes}',
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(color: AppColors.blue),
                          ),
                        ],
                      ),

                      Text(
                        '${exam.numberOfQuestions} ${t.questions}',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: AppColors.gray),
                      ),
                      const Spacer(),
                      Text(
                        'From: 1.00  To: 6.00',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
