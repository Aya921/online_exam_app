import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/auth/domin/entities/user_entity.dart';
import 'package:exam_app/features/auth/presentation/view_model/signup_view_model/signup_events.dart';
import 'package:exam_app/features/auth/presentation/view_model/signup_view_model/signup_view_model.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.active,
    required this.t,
    this.signupViewModel,
    this.userModel,
  });

  final bool active;
  final AppLocalizations t;
  final SignupViewModel? signupViewModel;
  final UserModel? userModel;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: WidgetStateProperty.all(active ? 10 : 0),
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        backgroundColor: WidgetStateProperty.all(
          active ? AppColors.blue : AppColors.gray,
        ),
        mouseCursor: WidgetStateProperty.all(
          active ? SystemMouseCursors.click : SystemMouseCursors.basic,
        ),
      ),
      onPressed: () {
        if (active) {
          if (signupViewModel != null && userModel != null) {
            signupViewModel!.add(SignUpUserEvent(userModel!));
          }
        }
      },

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Text(
          t.signupButtonText,
          style: const TextStyle(color: AppColors.white, fontSize: 16),
        ),
      ),
    );
  }
}
