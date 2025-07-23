import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/features/auth/presentation/validator/signup_validators.dart';
import 'package:exam_app/features/auth/presentation/view_model/forget_password_view_model/forget_password_cubit.dart';
import 'package:exam_app/features/auth/presentation/view_model/forget_password_view_model/forget_password_events.dart';
import 'package:exam_app/features/auth/presentation/views/widgets/custom_form_field_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordWidget extends StatelessWidget {
  const ResetPasswordWidget({
    super.key,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
  }) : _passwordController = passwordController,
  _confirmPasswordController = confirmPasswordController;

  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 40),
          Text(
            t.resetPassword,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Please enter your code that send to your\n email address ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 32),
          CustomTextFormField(
            obsecureTxt: true,
            controller: _passwordController,
            label: AppLocalizations.of(context)!.newPassword,
            hint: AppLocalizations.of(context)!.enterYourPassword,
            emptyFiledErrorMessage: AppLocalizations.of(
              context,
            )!.pleaseEnterYourEmail,
            formFieldValidator: SignupValidators(
              appLocalization: t,
            ).passwprdValidatiion,
          ),
          const SizedBox(height: 24),
          CustomTextFormField(
            obsecureTxt: true,
            controller: _confirmPasswordController,
            label: AppLocalizations.of(context)!.confirmPassword,
            hint: AppLocalizations.of(context)!.confirmPassword,
            emptyFiledErrorMessage: AppLocalizations.of(
              context,
            )!.pleaseEnterYourEmail,
            confirmPasswordFunction: SignupValidators(
              appLocalization: t,
            ).confirmPasswordValidatiion,
            passwordCompareValue: _passwordController,
          ),
          const SizedBox(height: 48),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: FilledButton(
                    onPressed: () {
                      context.read<ForgetPasswordBloc>().add(
                        ResetPasswordEvent(_passwordController.text),
                      );
                    },
                    child: Text(
                      t.continue_button,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
