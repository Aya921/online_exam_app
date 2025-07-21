import 'package:exam_app/confing/di/di.dart';
import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/core/route/app_routes.dart';
import 'package:exam_app/core/theme/app_colors.dart';

import 'package:exam_app/features/auth/domin/entities/forgot_password_req.dart';
import 'package:exam_app/features/auth/presentation/validator/signup_validators.dart';
import 'package:exam_app/features/auth/presentation/view_model/forgot_password_view_model/forgot_password_events.dart';
import 'package:exam_app/features/auth/presentation/view_model/forgot_password_view_model/forgot_password_states.dart';
import 'package:exam_app/features/auth/presentation/view_model/forgot_password_view_model/forgot_password_view_model.dart';
import 'package:exam_app/features/auth/presentation/views/widgets/custom_form_field_button.dart';
import 'package:exam_app/features/auth/presentation/views/widgets/register_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  late ForgotPasswordViewModel forgotPasswordViewModel;
  final TextEditingController _myEmailController = TextEditingController();
  bool active = true;

  @override
  void initState() {
    forgotPasswordViewModel = getIt.get<ForgotPasswordViewModel>();
    super.initState();
  }

  ForgotPasswordRequset makeForgotModel() {
    final forgetModel = ForgotPasswordRequset(
      email: _myEmailController.text.trim(),
    );
    return forgetModel;
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => forgotPasswordViewModel,
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
          child: BlocListener<ForgotPasswordViewModel, ForgotPasswordStates>(
            listener: (context, state) {
              if (state.isLoading) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(t.wait)));
              }
              if (state.isSuccess) {
                Navigator.of(context).pushNamed(AppRoutes.resetCode);
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
              key: forgotPasswordViewModel.formKey,
              child: Column(
                children: [
                  const Text(
                    "Forget Password",
                    style: TextStyle(fontSize: 18, color: AppColors.black),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    textAlign: TextAlign.center,
                    "Please enter your email associated to \n your account",
                    style: TextStyle(fontSize: 18, color: AppColors.gray),
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
                      return forgotPasswordViewModel.add(
                        ValidateForgotPasswordEvent(),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: [
                      Expanded(
                        child: RegisterButton(
                          active: active,

                          text: t.continue_button,
                          forgotPasswordViewModel: forgotPasswordViewModel,
                          forgotPasswordRequest: makeForgotModel(),
                          controller: _myEmailController,
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
