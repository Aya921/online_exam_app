import 'package:exam_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustumButtom extends StatelessWidget {
  final String txt;
  final Color color;
  final Color borderColor;
  final Color fontColor;
  final double circularRaduis;

  const CustumButtom({
    super.key,
    required this.txt,
    this.color = Colors.transparent,
    this.borderColor = Colors.transparent,
    this.fontColor = AppColors.blue,  this.circularRaduis=10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(circularRaduis),
        color: color,
        border: Border.all(color: borderColor, width: 1.5),
      ),

      child: Text(
        txt,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: fontColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
