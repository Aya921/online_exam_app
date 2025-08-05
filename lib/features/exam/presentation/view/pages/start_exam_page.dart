import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/core/route/app_routes.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/exam/domin/entity/exam_model.dart';
import 'package:flutter/material.dart';

class StartExamPage extends StatelessWidget {
  const StartExamPage({
    super.key,
    required this.exam,
    required this.subjectName,
  });
  final ExamModel exam;
  final String subjectName;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Image.asset('assets/images/exam.png'),
                const SizedBox(width: 8),
                Text(
                  subjectName,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                Text(
                  '${exam.duration!} ${t!.minutes}',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.blue,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: 16),
              Text(
                exam.title!,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(width: 8),
              Container(width: 2, height: 21, color: AppColors.blue.shade200),
              const SizedBox(width: 8),

              Text(
                '${exam.numberOfQuestions} ${t!.questions}',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Divider(color: AppColors.blue.withOpacity(0.2), thickness: 1),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Instructions',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: AppColors.black,

                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const BulletText('Lorem ipsum dolor sit amet consectetur.'),
                const BulletText('Lorem ipsum dolor sit amet consectetur.'),
                const BulletText('Lorem ipsum dolor sit amet consectetur.'),
                const BulletText('Lorem ipsum dolor sit amet consectetur.'),
              ],
            ),
          ),
          const SizedBox(height: 48),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.blue,
                foregroundColor: AppColors.white,

                minimumSize: const Size(double.infinity, 48),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.question,
                  arguments: exam.id,
                );
              },
              child: Text(
                'Start',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BulletText extends StatelessWidget {
  final String text;
  const BulletText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '•',
            style: TextStyle(fontSize: 20, color: AppColors.gray),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppColors.gray),
            ),
          ),
        ],
      ),
    );
  }
}
