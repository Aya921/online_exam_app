import 'package:exam_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CustumCircularPerecent extends StatelessWidget {
  const CustumCircularPerecent({
    super.key,
    required this.greenPercent,
    required this.redStartAngle,
    required this.redPercent,
  });

  final double greenPercent;
  final double redStartAngle;
  final double redPercent;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircularPercentIndicator(
              radius: 80.0,
              lineWidth: 10.0,
              
              percent: greenPercent,
              progressColor: AppColors.blue,
              backgroundColor: Colors.transparent,
            ),
            Transform.rotate(
              angle: redStartAngle,
              child: CircularPercentIndicator(
                radius: 80.0,
                lineWidth: 8.0,
                
                percent: redPercent,
                progressColor: AppColors.red,
                backgroundColor: Colors.transparent,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

