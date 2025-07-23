// ignore: must_be_immutable
import 'package:exam_app/core/theme/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCode extends StatefulWidget {
  final TextEditingController otpController;

  final ValueNotifier<bool> pinErrorNotifier;
  final void Function(String)? onCompleted;
  const CustomPinCode({
    super.key,
    required this.otpController,
    this.onCompleted,
    required this.pinErrorNotifier,
  });

  @override
  State<CustomPinCode> createState() => _CustomPinCodeState();
}

class _CustomPinCodeState extends State<CustomPinCode> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.pinErrorNotifier,
      builder: (context, pinError, _) {
        return Column(
          children: [
            PinCodeTextField(
              appContext: context,
              length: 6,
              controller: widget.otpController,

              animationType: AnimationType.fade,
              keyboardType: TextInputType.number,

              autoFocus: true,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 50,
                activeFillColor: AppColors.white,
                selectedFillColor: AppColors.white,
                inactiveFillColor: pinError
                    ? AppColors.white
                    : AppColors.blue[50],
                inactiveColor: pinError ? Colors.red : Colors.transparent,

                selectedColor: AppColors.blue,
                activeColor: pinError ? Colors.red : AppColors.blue,
              ),
              animationDuration: const Duration(milliseconds: 100),
              enableActiveFill: true,
              onChanged: (value) {
                if (pinError) {
                  widget.pinErrorNotifier.value = false;
                }
              },

              onCompleted: widget.onCompleted,
            ),

            if (pinError)
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.error_outline, color: Colors.red),
                  SizedBox(width: 5),
                  Text(
                    "Invalid code",
                    style: TextStyle(color: AppColors.red),
                    //textAlign: TextAlign.start,
                  ),
                ],
              ),
          ],
        );
      },
    );
  }
}
