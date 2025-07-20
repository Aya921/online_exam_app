import 'package:flutter/material.dart';
import 'package:exam_app/core/theme/app_colors.dart';

class LoginFooter extends StatelessWidget {
  final VoidCallback onpress;

  final String? haveAccountText;
  final String? donotHaveAccountText;
  final String? signupText;
  final String? loginText;

  const LoginFooter({
    super.key,
    required this.onpress,
    this.haveAccountText,
    this.donotHaveAccountText,
    this.signupText,
    this.loginText,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          haveAccountText ?? donotHaveAccountText ?? '',
          style: textTheme.bodyLarge?.copyWith(color: AppColors.black),
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: onpress,
            child: Text(
              "  ${signupText ?? loginText ?? ''}",
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
