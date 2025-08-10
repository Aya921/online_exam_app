import 'package:exam_app/core/constant/validator_constants/signup_validator_constants.dart';
import 'package:exam_app/core/l10n/translations/app_localizations.dart';
import 'package:flutter/widgets.dart';

class SignupValidators {
  final AppLocalizations _appLocalizations;
  SignupValidators({required AppLocalizations appLocalization})
    : _appLocalizations = appLocalization;

  String? userNameValidatiion(String? value) {
    if (value!.length < 3) {
      return _appLocalizations.tooShort;
    }
    return null;
  }

  String? firstNameValidatiion(String? value) {
    final firstnameRegex = RegExp(ValidatorConstants.nameRegex);
    if (value!.length < 3) {
      return _appLocalizations.tooShort;
    }
    if (!firstnameRegex.hasMatch(value)) {
      return _appLocalizations.emptyFirstNameError;
    }

    return null;
  }

  String? lastNameValidatiion(String? value) {
    final lastnameRegex = RegExp(ValidatorConstants.nameRegex);
    if (value!.length < 3) {
      return _appLocalizations.tooShort;
    }
    if (!lastnameRegex.hasMatch(value)) {
      return _appLocalizations.emptyLastNameError;
    }

    return null;
  }

  String? emailValidatiion(String? value) {
    final emailRegex = RegExp(ValidatorConstants.emailRegex);
    if (!emailRegex.hasMatch(value!)) {
      return _appLocalizations.emptyEmailError;
    }

    return null;
  }

  String? passwprdValidatiion(String? value) {
    final passwordRegex = RegExp(ValidatorConstants.passwordRegex);

    if (!passwordRegex.hasMatch(value!)) {
      return _appLocalizations.invalidPassword;
    }
    return null;
  }

  String? confirmPasswordValidatiion(
    String? value,
    TextEditingController? optionalValue,
  ) {
    if (value != optionalValue!.text) {
      return _appLocalizations.confirmPasswordMismatch;
    }
    return null;
  }

  String? phoneValidation(String? value) {
    final phoneRegex = RegExp(ValidatorConstants.phoneRegex);
    if (!phoneRegex.hasMatch(value!)) {
      return _appLocalizations.invalidPhoneNumber;
    }
    return null;
  }
}
