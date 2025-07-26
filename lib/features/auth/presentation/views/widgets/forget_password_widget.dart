import 'package:exam_app/confing/di/di.dart';
import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/features/auth/presentation/validator/signup_validators.dart';
import 'package:exam_app/features/auth/presentation/view_model/forget_password_view_model/forget_password_cubit.dart';
import 'package:exam_app/features/auth/presentation/view_model/forget_password_view_model/forget_password_events.dart';
import 'package:exam_app/features/auth/presentation/views/widgets/custom_form_field_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


// ignore: must_be_immutable
class ForgetPasswordWidget extends StatelessWidget {
  ForgetPasswordWidget(
    BuildContext context, {
    super.key,
    required this.emailController,
  
    required this.autovalidateMode,
  });
  final TextEditingController emailController;
  final GlobalKey<FormState> formKey=GlobalKey();
  AutovalidateMode autovalidateMode;

  
  final ForgetPasswordBloc forgetPasswordBloc=getIt.get<ForgetPasswordBloc>();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 40),
          Text(
            t.forgetPass,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
      
          const SizedBox(height: 20),
      
          const Text(
            'Please enter your email associated to\n your account',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 32),
          CustomTextFormField(
            label: t.emailLabel,
            hint: t.emailHint,
            formFieldValidator: SignupValidators(
              appLocalization: t,
            ).emailValidatiion,
            emptyFiledErrorMessage: t.emptyEmailError,
            controller: emailController,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: FilledButton(
                    onPressed: () {
                      if (forgetPasswordBloc.validateForm(formKey)) {
                        context.read<ForgetPasswordBloc>().add(
                          SendResetEmailEvent(emailController.text.trim()),
                        );
      
                        autovalidateMode = AutovalidateMode.disabled;
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                      }
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
