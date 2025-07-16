import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/core/route/app_routes.dart';
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
        Text(AppLocalizations.of(context)!.dontHaveAccount, style: textTheme.bodyLarge),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, AppRoutes.signup);
          },
          child: Text(
            ' ${AppLocalizations.of(context)!.signUp}',
            style: textTheme.bodyLarge?.copyWith(
              color: AppColors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
