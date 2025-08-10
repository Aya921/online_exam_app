import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/exam/presentation/view_models/qustion_view_model/quesion_state.dart';
import 'package:exam_app/features/exam/presentation/view_models/qustion_view_model/quesion_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustumTimer extends StatelessWidget {
  final int duration;

  const CustumTimer({super.key, required this.duration});

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final sec = seconds % 60;

    return "${minutes.toString().padLeft(2, '0')} : ${sec.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    late bool isHalfTimer = false;
    return BlocBuilder<QustionViewModel, QuestionState>(
      builder: (context, state) {
        if (state.seconds != null) {
          if (state.seconds == ((duration * 60) ~/ 2) - 1) {
            isHalfTimer = true;
          }
          return Text(
            formatTime(state.seconds!),
            style: TextStyle(
              fontSize: 18,
              color: isHalfTimer ? AppColors.red : AppColors.green,
            ),
          );
        } else {
          return const Text("no");
        }
      },
    );
  }
}
