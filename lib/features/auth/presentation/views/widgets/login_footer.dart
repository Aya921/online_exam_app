import 'package:flutter/material.dart';
import 'package:exam_app/core/theme/app_colors.dart';

class LoginFooter extends StatelessWidget {
  final VoidCallback onpress;

  final String primaryText;

  final String secondrytText;


  const LoginFooter({
    super.key,
    required this.onpress,
   
    required this.primaryText,
    required this.secondrytText
    
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
         primaryText,
          style: textTheme.bodyLarge?.copyWith(color: AppColors.black),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: onpress,
            child: Text(
              "  $secondrytText",
              style: textTheme.bodyLarge?.copyWith(
                color: AppColors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
