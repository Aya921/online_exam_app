import 'dart:async';

import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/exam/presentation/view_models/qustion_view_model/quesion_events.dart';
import 'package:exam_app/features/exam/presentation/view_models/qustion_view_model/quesion_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustumTimer extends StatefulWidget {
  final int duration;
  final QustionViewModel qustionViewModel;

  const CustumTimer({
    super.key,
    required this.duration,
    required this.qustionViewModel,
  });

  @override
  State<CustumTimer> createState() => _CustumTimerState();
}

class _CustumTimerState extends State<CustumTimer> {
  Timer? timer;
  late int seconds = widget.duration;
  late int halftime;
  bool isHalfTimer = false;

  @override
  void initState() {
    timer?.cancel();
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    seconds = widget.duration * 60;

    halftime = (seconds ~/ 2) - 1;
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds > 0) {
        setState(() {
          seconds--;
          if (seconds == halftime) {
            isHalfTimer = true;
          }
        });
      } else {
        t.cancel();
       
        widget.qustionViewModel.add(EndTimeEvent());
      }
    });
  }

  String formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final sec = seconds % 60;

    return "${minutes.toString().padLeft(2, '0')} : ${sec.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      formatTime(seconds),
      style: TextStyle(
        fontSize: 18,
        color: isHalfTimer ? AppColors.red : AppColors.green,
      ),
    );
  }
}
