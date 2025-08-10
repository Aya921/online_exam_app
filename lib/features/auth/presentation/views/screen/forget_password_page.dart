import 'package:exam_app/confing/di/di.dart';

import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/features/auth/presentation/view_model/forget_password_view_model/forget_password_cubit.dart';
import 'package:exam_app/features/auth/presentation/view_model/forget_password_view_model/forget_password_state.dart';
import 'package:exam_app/features/auth/presentation/views/widgets/forget_password_widget.dart';
import 'package:exam_app/features/auth/presentation/views/widgets/otp_vrify_widget.dart';
import 'package:exam_app/features/auth/presentation/views/widgets/reset_passowrd_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

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
  void dispose() {
    _emailController.dispose();
    _otpController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return BlocProvider<ForgetPasswordBloc>(
      create: (BuildContext context) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.password),
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
                    SnackBar(
                      content: Text(t.passwordResetSuccessfully),
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
