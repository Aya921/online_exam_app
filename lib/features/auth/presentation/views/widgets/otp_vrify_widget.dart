import 'package:exam_app/confing/di/di.dart';
import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/features/auth/presentation/view_model/forget_password_view_model/forget_password_cubit.dart';
import 'package:exam_app/features/auth/presentation/view_model/forget_password_view_model/forget_password_events.dart';
import 'package:exam_app/features/auth/presentation/views/widgets/custom_pin_code.dart';
import 'package:exam_app/features/auth/presentation/views/widgets/login_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpVrifyWidget extends StatelessWidget {
  OtpVrifyWidget({
    required this.email,
    super.key,
    required TextEditingController otpController,
    required this.pinErrorNotifier,
  }) : _otpController = otpController;
  final String email;

  final TextEditingController _otpController;
  final ValueNotifier<bool> pinErrorNotifier;
  final ForgetPasswordBloc forgetPasswordBloc = getIt.get<ForgetPasswordBloc>();

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Column(
      children: [
        const SizedBox(height: 40),
        Text(
          t.emailVerification,
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
        CustomPinCode(
          otpController: _otpController,
          onCompleted: (value) {
            context.read<ForgetPasswordBloc>().add(VerifyCodeEvent(value));
          },
          pinErrorNotifier: pinErrorNotifier,
        ),

        LoginFooter(
          onpress: () {
            context.read<ForgetPasswordBloc>().add(SendResetEmailEvent(email));
          },
          primaryText: t.donotReciveCode,
          secondrytText: t.resend,
        ),
      ],
    );
  }
}
