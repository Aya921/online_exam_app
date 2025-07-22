import 'package:exam_app/confing/di/di.dart';
import 'package:exam_app/core/l10n/translations/app_localizations.dart';

import 'package:exam_app/core/theme/app_colors.dart';

import 'package:exam_app/features/auth/presentation/validator/signup_validators.dart';
import 'package:exam_app/features/auth/presentation/view_model/reset_password_view_model/reset_password_events.dart';

import 'package:exam_app/features/auth/presentation/view_model/reset_password_view_model/reset_password_states.dart';
import 'package:exam_app/features/auth/presentation/view_model/reset_password_view_model/reset_password_view_model.dart';
import 'package:exam_app/features/auth/presentation/views/widgets/custom_form_field_button.dart';
import 'package:exam_app/features/auth/presentation/views/widgets/register_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  late ResetPasswordViewModel resetPasswordViewModel;
  final TextEditingController _myEmailController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  bool active = true;

  @override
  void initState() {
    resetPasswordViewModel = getIt.get<ResetPasswordViewModel>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => resetPasswordViewModel,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),

          title: Text(t.password, style: const TextStyle(fontSize: 30)),
        ),

        body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocListener<ResetPasswordViewModel, ResetPasswordStates>(
            listener: (context, state) {
              if (state.isLoading) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(t.wait)));
              }
              if (state.isSuccess) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("Done")));

                state.isSuccess = false;
              }
              if (state.errorMessage != null) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));

                state.errorMessage = null;
              }
              if (state.isValid != null) {
                setState(() {
                  active = state.isValid!;
                });
              }
            },
            child: Form(
              key: resetPasswordViewModel.formKey,
              child: Column(
                children: [
                   Text(
                    t.resetPassword,
                    style:const  TextStyle(fontSize: 20, color: AppColors.black,fontWeight:FontWeight.w600 ),
                  ),

                  const SizedBox(height: 20),

                   Text(
                    textAlign: TextAlign.center,
                    t.passwordruleAtResetPassPage,
                    style: const TextStyle(fontSize: 18, color: AppColors.gray),
                  ),

                  const SizedBox(height: 20),

                  CustomTextFormField(
                    controller: _myEmailController,
                    label: t.emailLabel,
                    hint: t.emailHint,
                    formFieldValidator: SignupValidators(
                      appLocalization: t,
                    ).emailValidatiion,
                    emptyFiledErrorMessage: t.emptyEmailError,
                    onChanged: () {
                      resetPasswordViewModel.add(ValidateResetPasswordEvent());
                    },
                  ),

                  const SizedBox(height: 20),

                  CustomTextFormField(
                    controller: _newPasswordController,
                    label: t.passwordLabel,
                    obsecureTxt: true,
                    hint: t.passwordHint,
                    formFieldValidator: SignupValidators(
                      appLocalization: t,
                    ).passwprdValidatiion,
                    emptyFiledErrorMessage: t.emptyPasswordError,
                    onChanged: () {
                      resetPasswordViewModel.add(ValidateResetPasswordEvent());
                    },
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: RegisterButton(
                          active: active,

                          text: t.continue_button,

                          resetPasswordViewModel: resetPasswordViewModel,
                          controller1: _myEmailController,
                          controller2: _newPasswordController,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
