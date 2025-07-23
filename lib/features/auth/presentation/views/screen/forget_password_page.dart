import 'package:exam_app/confing/di/di.dart';

import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/features/auth/presentation/validator/forget_password_validators.dart';
import 'package:exam_app/features/auth/presentation/validator/login_validators.dart';
import 'package:exam_app/features/auth/presentation/validator/signup_validators.dart';
import 'package:exam_app/features/auth/presentation/view_model/forget_password_view_model/forget_password_cubit.dart';
import 'package:exam_app/features/auth/presentation/view_model/forget_password_view_model/forget_password_events.dart';
import 'package:exam_app/features/auth/presentation/view_model/forget_password_view_model/forget_password_state.dart';
import 'package:exam_app/features/auth/presentation/views/widgets/custom_form_field_button.dart';
import 'package:exam_app/features/auth/presentation/views/widgets/custom_pin_code.dart';
import 'package:exam_app/features/auth/presentation/views/widgets/forget_password_widget.dart';
import 'package:exam_app/features/auth/presentation/views/widgets/login_footer.dart';
import 'package:exam_app/features/auth/presentation/views/widgets/otp_vrify_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordPage extends StatefulWidget {
  ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final ForgetPasswordBloc viewModel = getIt.get<ForgetPasswordBloc>();

  final formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final ValueNotifier<bool> pinErrorNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return BlocProvider<ForgetPasswordBloc>(
      create: (BuildContext context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            t.password,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
              listener: (context, state) {
                if (state.errorEmail != null && state.errorEmail!.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorEmail!),
                      backgroundColor: Colors.red,
                    ),
                  );
                }

                if (state.errorOtp != null && state.errorOtp!.isNotEmpty) {
                  pinErrorNotifier.value = true;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorOtp!),
                      backgroundColor: Colors.red,
                    ),
                  );
                }

                if (state.isPasswordReset == true) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('password reset successfully'),
                      backgroundColor: Colors.green,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state.isvrifyCodeSent != true) {
                  return ForgetPasswordWidget(
                    context,
                    emailController: _emailController,
                    formKey: formKey,
                    autovalidateMode: autovalidateMode,
                  );
                } else if (state.isOtpCorrect != true) {
                  return OtpVrifyWidget(
                    pinErrorNotifier: pinErrorNotifier,
                    email: state.email!,
                    otpController: _otpController,
                  );
                } else if (state.isOtpCorrect == true) {
                  return ResetPasswordWidget(
                    passwordController: _passwordController,
                    confirmPasswordController: _confirmPasswordController,
                  );
                } else {
                  return const Center(child: Text('Something went wrong'));
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

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
          const Text(
            'Email verification',
            style: TextStyle(
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
