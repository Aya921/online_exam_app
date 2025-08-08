import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  const ResultCard({super.key});
  

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
                            "High Level",
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          Text(
                            '30 ${t!.minutes}',
                            style: Theme.of(context).textTheme.bodyLarge
                                ?.copyWith(color: AppColors.blue),
                          ),
                        ],
                      ),

                      Text(
                        '${10} ${t.questions}',
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(color: AppColors.gray),
                      ),
                      const Spacer(),
                      Text(
                        '18 correct answers in 25min',
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
