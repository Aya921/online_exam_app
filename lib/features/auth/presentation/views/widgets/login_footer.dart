import 'package:flutter/material.dart';
import 'package:exam_app/core/theme/app_colors.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account? ", style: textTheme.bodyLarge),
        Text(
          'Sign up',
          style: textTheme.bodyLarge?.copyWith(
            color: AppColors.blue,
            decoration: TextDecoration.underline,
          ),
        ),
      ],
    );
  }
}
