import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/exam/domin/entity/subject_model.dart';
import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  const SubjectCard({super.key, required this.subject});
  final SubjectModel subject;

  @override
  Widget build(BuildContext context) {
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
          height: 80,

          child: Row(
            children: [
              const SizedBox(width: 24),
              SizedBox(
                width: 48,
                height: 48,
                child: Image.network(
                  subject.icon!,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) =>
                      loadingProgress == null
                      ? child
                      : const CircularProgressIndicator(),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                subject.name!,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: AppColors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
