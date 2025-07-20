
import 'package:exam_app/core/theme/app_colors.dart';
import 'package:exam_app/features/auth/domin/entities/signin_req.dart';
import 'package:exam_app/features/auth/domin/entities/signup_req.dart';
import 'package:exam_app/features/auth/presentation/view_model/signin_cubit/signin_cubit.dart';

import 'package:exam_app/features/auth/presentation/view_model/signup_view_model/signup_events.dart';
import 'package:exam_app/features/auth/presentation/view_model/signup_view_model/signup_view_model.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.active,

    this.signupViewModel,
    this.signupRequest,
    this.signInRequest,
    this.signinCubit,
    this.loginButtonText,
    this.signupButtonText,
  });

  final bool active;
  final String? loginButtonText;
  final String? signupButtonText;
  final SignupViewModel? signupViewModel;
  final SigninCubit? signinCubit;
  final SignupRequest? signupRequest;
  final SignInRequest? signInRequest;

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
          if (signupViewModel != null && signupRequest != null) {
            signupViewModel!.add(SignUpUserEvent(signupRequest!));
          } else if (signinCubit != null && signInRequest != null) {
            if (signinCubit!.checkValidation()) {
              signinCubit!.signIn(signInRequest!);
            }
          } 
        }
      },

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Text(
          loginButtonText ?? signupButtonText ?? '',
          style: const TextStyle(color: AppColors.white, fontSize: 16),
        ),
      ),
    );
  }
}
