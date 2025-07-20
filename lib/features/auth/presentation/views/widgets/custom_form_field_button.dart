import 'package:exam_app/features/auth/presentation/validator/general_validation.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final VoidCallback?
  onChanged; //--> to make a button is not able to be clickabel until all fields is validate correctly
  final String
  emptyFiledErrorMessage; // when empty field ---->  what message you want to show
  final String? Function(String?)? formFieldValidator;
  final TextEditingController? passwordCompareValue;
  final String? Function(String?, TextEditingController?)?
  confirmPasswordFunction; // because the funtion of confirmPassword take 2 arguments but validator take only one so make it optional for both so when use any field just use a formValidtor
  final bool? obsecureTxt;

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.formFieldValidator,
    required this.emptyFiledErrorMessage,
    this.passwordCompareValue,
    this.obsecureTxt,
    this.confirmPasswordFunction,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obsecureTxt ?? false,
      onChanged: (_) {
        if (onChanged != null) {
          onChanged!();
        }
      },

      decoration: InputDecoration(labelText: label, hintText: hint),
      validator: (value) {
        final generalError = GeneralValidation.emptyValidation(
          value,
          emptyFiledErrorMessage,
        );
        if (generalError != null) return generalError;
        final String? result;

        if (passwordCompareValue != null && confirmPasswordFunction != null) {
          result = confirmPasswordFunction!(value, passwordCompareValue);
        } else {
          result = formFieldValidator!(value);
        }

        if (result != null) return result;

        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
