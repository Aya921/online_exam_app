import 'package:exam_app/confing/di/di.dart';
import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:exam_app/core/theme/app_colors.dart';


import 'package:exam_app/features/auth/domin/entities/verfity_code_req.dart';

import 'package:exam_app/features/auth/presentation/view_model/forgot_password_view_model/forgot_password_states.dart';
import 'package:exam_app/features/auth/presentation/view_model/forgot_password_view_model/forgot_password_view_model.dart';
import 'package:exam_app/features/auth/presentation/view_model/verify_code_view_model/verify_code_events.dart';
import 'package:exam_app/features/auth/presentation/view_model/verify_code_view_model/verify_code_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ResetCode extends StatefulWidget {
  const ResetCode({super.key});

  @override
  State<ResetCode> createState() => _ResetCodeState();
}

class _ResetCodeState extends State<ResetCode> {
  late VerifyCodeViewModel verifyCodeViewModel;

 
  String otp = '';

  @override
  void initState() {
    verifyCodeViewModel = getIt.get<VerifyCodeViewModel>();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

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
          child: BlocListener<ForgotPasswordViewModel, ForgotPasswordStates>(
            listener: (context, state) {
              if (state.isLoading) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(t.wait)));
              }
              if (state.isSuccess) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("done")));
                state.isSuccess = false;
              }
              if (state.errorMessage != null) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));

                state.errorMessage = null;
              }
             
            },
            child: Column(
              children: [
                const Text(
                  "Email verification",
                  style: TextStyle(fontSize: 18, color: AppColors.black),
                ),
            
                const SizedBox(height: 20),
            
                const Text(
                  textAlign: TextAlign.center,
                  "Please enter your code that send to your \n email address ",
                  style: TextStyle(fontSize: 18, color: AppColors.gray),
                ),
            
                const SizedBox(height: 20),
            
                PinCodeTextField(
                  appContext: context,
                  length: 6,
                 
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  autoFocus: true,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.grey.shade200,
                    inactiveColor: Colors.grey,
                    selectedColor: AppColors.blue,
                    activeColor: AppColors.blue,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onChanged: (value) {
                    setState(() {
                      otp = value;
                    });
                  },
                  onCompleted: (value) {
                    print("OTP Entered: $value");
                    otp = value;
                      verifyCodeViewModel.add(
            VerifyEmailCodeEvent(verifyResetCodeRequest: VerifyResetCodeRequest(otp)),
                        );
                 
                  },
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
