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
    this.text,
    // this.forgotPasswordViewModel,
    // this.forgotPasswordRequest,
    this.controller1,
    this.controller2,
    // this.resetPasswordRequest,
    // this.resetPasswordViewModel,
  });

  final bool active;
  final String? text;

  final SignupViewModel? signupViewModel;
  final SigninCubit? signinCubit;
  final SignupRequest? signupRequest;
  final SignInRequest? signInRequest;
  // final ForgotPasswordViewModel? forgotPasswordViewModel;
  // final ForgotPasswordRequset? forgotPasswordRequest;
  // final ResetPasswordRequest? resetPasswordRequest;
  // final ResetPasswordViewModel? resetPasswordViewModel;

  final TextEditingController? controller1;
  final TextEditingController? controller2;

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
          
          
          // else if (forgotPasswordViewModel != null &&
          //     forgotPasswordRequest != null) {
          //   forgotPasswordViewModel!.add(
          //     SendForgotPasswordEmailEvent(
          //       ForgotPasswordRequset(email: controller1!.text.trim()),
          //     ),
          //   );
          // } 
          
          // else if (resetPasswordViewModel != null) {
          //   resetPasswordViewModel!.add(
          //     ResetNewPasswordEvent(
          //       ResetPasswordRequest(
          //         controller1!.text.trim(),
          //         controller2!.text.trim(),
          //       ),
          //     ),
          //   );
          // }
        }
      },

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Text(
          text ?? '',
          style: const TextStyle(color: AppColors.white, fontSize: 16),
        ),
      ),
    );
  }
}
