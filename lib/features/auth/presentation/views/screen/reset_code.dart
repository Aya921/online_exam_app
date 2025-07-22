// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:exam_app/core/route/app_routes.dart';

import 'package:exam_app/features/auth/presentation/view_model/verify_code_view_model/verify_code_events.dart';
import 'package:exam_app/features/auth/presentation/views/widgets/custom_pin_code.dart';
import 'package:exam_app/features/auth/presentation/views/widgets/login_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:exam_app/confing/di/di.dart';
import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/core/theme/app_colors.dart';

import 'package:exam_app/features/auth/presentation/view_model/verify_code_view_model/verify_code_state.dart';
import 'package:exam_app/features/auth/presentation/view_model/verify_code_view_model/verify_code_view_model.dart';

class ResetCode extends StatefulWidget {
  final String? email;

  const ResetCode({super.key, this.email});

  @override
  State<ResetCode> createState() => _ResetCodeState();
}

class _ResetCodeState extends State<ResetCode> {
  late VerifyCodeViewModel verifyCodeViewModel;
  //late ForgotPasswordViewModel forgotPasswordViewModel;
  final TextEditingController otpController = TextEditingController();
  final ValueNotifier<bool> pinErrorNotifier = ValueNotifier(false);

  String otp = '';

  @override
  void initState() {
    verifyCodeViewModel = getIt.get<VerifyCodeViewModel>();
    //// forgotPasswordViewModel = getIt.get<ForgotPasswordViewModel>();
    super.initState();
  }

  void changeState() async {
    await Future.delayed(const Duration(seconds: 2));
    pinErrorNotifier.value = false;
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    final String email = widget.email ?? '';

    return BlocProvider(
      create: (context) => verifyCodeViewModel,
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
          child: BlocListener<VerifyCodeViewModel, VerifyCodeState>(
            listener: (context, state) {
              if (state.isLoading) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(t.wait)));
              }
              if (state.isSuccess) {
                Navigator.pushNamed(context, AppRoutes.resetPassword);
                state.isSuccess = false;
              }
              if (state.errorMessage != null) {
                otpController.clear();
                pinErrorNotifier.value = true;
                changeState();

                state.errorMessage = null;
              }
            },
            child: Column(
              children: [
                 Text(
                  t.emailVerification,
                  style:const  TextStyle(fontSize: 20, color: AppColors.black,fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 20),

                 Text(
                  textAlign: TextAlign.center,
                  t.enterCodeToSendToEmailAddress,
                  style: const TextStyle(fontSize: 18, color: AppColors.gray),
                ),

                const SizedBox(height: 40),

                CustomPinCode(
                  otpController: otpController,
                  pinErrorNotifier: pinErrorNotifier,
                  otp: otp,
                  verifyCodeViewModel: verifyCodeViewModel,
                ),

                const SizedBox(height: 10),

                LoginFooter(
                  onpress: () {
                    verifyCodeViewModel.add(ResendCodeAgainEvent(email));
                   
                  },
                  primaryText: t.donotReciveCode,
                  secondrytText: t.resend,
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
